return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		{ "kevinhwang91/promise-async" },
	},
	config = function()
		vim.o.foldcolumn = "0"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
		-- Toggle folds
		vim.keymap.set("v", "<space>", ":fold<CR>")
		vim.keymap.set("n", "<space>", "zA")

		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				vim.api.nvim_set_hl(0, "Folded", { bg = "NONE", italic = true })
			end,
		})
		-- Also set immediately for current colorscheme
		vim.api.nvim_set_hl(0, "Folded", { bg = "NONE", italic = true })

		local function rescript_fold_provider(bufnr)
			local parsers = require("nvim-treesitter.parsers")

			local parser = parsers.get_parser(bufnr)
			if not parser then
				return {}
			end

			local tree = parser:parse()[1]
			if not tree then
				return {}
			end

			local root = tree:root()
			local folds = {}

			local foldable_types = {
				["function"] = true,
			}

			local function collect_folds(node)
				local node_type = node:type()

				if foldable_types[node_type] then
					local start_row, _, end_row, _ = node:range()
					if end_row > start_row then
						table.insert(folds, {
							startLine = start_row,
							endLine = end_row,
							kind = node_type,
						})
					end
				end

				for child in node:iter_children() do
					collect_folds(child)
				end
			end

			collect_folds(root)
			return folds
		end

		-- Format text so folds show on newline
		local handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local foldedLines = endLnum - lnum

			-- Build the first line content
			local firstLineText = ""
			for _, chunk in ipairs(virtText) do
				firstLineText = firstLineText .. chunk[1]
			end

			local lineInfo = ("%d lines: "):format(foldedLines)
			local prefix = "+--- "
			local contentWidth = vim.fn.strdisplaywidth(prefix .. lineInfo .. firstLineText)
			local remainingWidth = width - contentWidth - 1
			local dashes = remainingWidth > 0 and string.rep("-", remainingWidth) or ""

			-- Classic vim style: +--- 45 lines: function foo() {--------
			table.insert(newVirtText, { prefix, "Comment" })
			table.insert(newVirtText, { lineInfo, "Comment" })

			for _, chunk in ipairs(virtText) do
				table.insert(newVirtText, chunk)
			end

			table.insert(newVirtText, { dashes, "Comment" })

			return newVirtText
		end

		-- Auto-fold on file open if file is long enough
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "rescript", "rust" },
			callback = function()
				vim.defer_fn(function()
					local bufnr = vim.api.nvim_get_current_buf()
					local line_count = vim.api.nvim_buf_line_count(bufnr)
					local win_height = vim.api.nvim_win_get_height(0)
					local threshold = math.floor(win_height * 0.75)
					-- Or hardcode: local threshold = 100

					if line_count <= threshold then
						return
					end

					local filetype = vim.bo[bufnr].filetype
					local ufo = require("ufo")

					if filetype == "rescript" then
						-- Custom provider only creates function folds, so this only closes functions
						ufo.closeAllFolds()
					elseif filetype == "rust" then
						-- Close all, then reopen everything except function_item
						ufo.closeAllFolds()
						ufo.openFoldsExceptKinds({ "function_item", "impl_item" })
					end
				end, 100) -- Delay to ensure ufo has processed folds
			end,
		})

		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				if filetype == "rescript" then
					return rescript_fold_provider
				end
				return { "treesitter", "indent" }
			end,

			-- Update text at the end
			fold_virt_text_handler = handler,

			-- Removed close_fold_kinds_for_ft since we handle it conditionally above
			close_fold_kinds_for_ft = {
				default = {},
			},
		})
	end,
}

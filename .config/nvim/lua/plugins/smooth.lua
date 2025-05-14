return {
	{
		{
			"sphamba/smear-cursor.nvim",

			opts = {
				-- Cursor color. Defaults to Normal gui foreground color
				-- cursor_color = "#d3cdc3",

				-- Background color. Defaults to Normal gui background color
				-- normal_bg = "#282828",

				-- Smear cursor when switching buffers
				smear_between_buffers = true,

				-- Smear cursor when moving within line or to neighbor lines
				smear_between_neighbor_lines = true,

				-- Draw the smear in buffer space instead of screen space when scrolling
				scroll_buffer_space = true,

				-- Use floating windows to display smears outside buffers.
				-- May have performance issues with other plugins.
				use_floating_windows = false,

				-- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
				-- Smears will blend better on all backgrounds.
				legacy_computing_symbols_support = false,

				-- Attempt to hide the real cursor when smearing.
				hide_target_hack = true,

				-- Smear cursor in insert mode.
				-- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
				smear_insert_mode = true,
			},
		},
	},
}

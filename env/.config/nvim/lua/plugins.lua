return {
	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			local statusline = require("mini.statusline")
			statusline.setup({
				-- Content of statusline as functions which return statusline string. See
				-- `:h statusline` and code of default contents (used instead of `nil`).
				content = {
					-- Content for active window
					active = nil,
					-- Content for inactive window(s)
					inactive = nil,
				},

				-- Whether to use icons by default
				use_icons = false,

				-- Whether to set Vim's settings for statusline (make it always shown with
				-- 'laststatus' set to 2). To use global statusline in Neovim>=0.7.0, set
				-- this to `false` and 'laststatus' to 3.
				set_vim_settings = true,
			})

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we disable the section for
			-- cursor information because line numbers are already enabled
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return ""
			end

			-- ... and there is more!
			--  Check out: https://github.com/echasnovski/mini.nvim
		end,
	},

	"github/copilot.vim",
}

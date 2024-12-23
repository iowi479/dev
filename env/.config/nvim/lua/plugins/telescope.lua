return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
		config = function()
			-- Two important keymaps to use while in telescope are:
			--  - Insert mode: <c-/>
			--  - Normal mode: ?
			require("telescope").setup({
				pickers = {
					find_files = {
						file_ignore_patterns = { "node_modules", ".git" },
						hidden = true,
					},
					live_grep = {
						additional_args = function()
							return { "--hidden" }
						end,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
			vim.keymap.set("n", "<leader>pg", builtin.git_files, {})
			vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>ph", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>pk", builtin.keymaps, {})
			vim.keymap.set("n", "<leader>p.", builtin.oldfiles, {})

			vim.keymap.set("n", "<leader>pw", function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end)

			vim.keymap.set("n", "<leader>pW", function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end)

			-- Slightly advanced example of overriding default behavior and theme
			vim.keymap.set("n", "<leader>/", function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			-- Also possible to pass additional configuration options.
			--  See `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set("n", "<leader>s/eovim", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			-- Shortcut for searching your neovim configuration files
			vim.keymap.set("n", "<leader>pc", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "Search in [C]onfig" })
		end,
	},
}

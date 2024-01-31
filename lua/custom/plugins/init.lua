-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.wo.relativenumber = true


return {
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {}
		},
	},
	{
		"mfussenegger/nvim-dap",
		config = function(_, _)
			--   require("core.utils").load_mappings("dap")
		end
	},

	{
		"Civitasv/cmake-tools.nvim",
		opts = {
			cmake_command = "cmake",                     -- this is used to specify cmake command path
			ctest_command = "ctest",                     -- this is used to specify ctest command path
			cmake_regenerate_on_save = true,             -- auto generate when save CMakeLists.txt
			cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
			cmake_build_options = {},                    -- this will be passed when invoke `CMakeBuild`
			-- support macro expansion:
			--       ${kit}
			--       ${kitGenerator}
			--       ${variant:xx}
			cmake_build_directory = "out/${variant:buildType}", -- this is used to specify generate directory for cmake, allows macro expansion, relative to vim.loop.cwd()
			cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir
			cmake_compile_commands_from_lsp = false, -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
			cmake_kits_path = nil,         -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
			cmake_variants_message = {
				short = { show = true }, -- whether to show short message
				long = { show = true, max_length = 40 }, -- whether to show long message
			},
			cmake_dap_configuration = {    -- debug settings for cmake
				name = "cpp",
				type = "codelldb",
				request = "launch",
				stopOnEntry = false,
				runInTerminal = true,
				console = "integratedTerminal",
			},
			cmake_executor = { -- executor to use
				name = "quickfix", -- name of the executor
				opts = {}, -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
				default_opts = { -- a list of default and possible values for executors
					quickfix = {
						show = "always", -- "always", "only_on_error"
						position = "belowright", -- "vertical", "horizontal", "leftabove", "aboveleft", "rightbelow", "belowright", "topleft", "botright", use `:h vertical` for example to see help on them
						size = 10,
						encoding = "utf-8", -- if encoding is not "utf-8", it will be converted to "utf-8" using `vim.fn.iconv`
						auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
					},
					toggleterm = {
						direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
						close_on_exit = false, -- whether close the terminal when exit
						auto_scroll = true, -- whether auto scroll to the bottom
					},
					overseer = {
						new_task_opts = {
							strategy = {
								"toggleterm",
								direction = "horizontal",
								autos_croll = true,
								quit_on_exit = "success"
							}
						}, -- options to pass into the `overseer.new_task` command
						on_new_task = function(task)
							require("overseer").open(
								{ enter = false, direction = "right" }
							)
						end, -- a function that gets overseer.Task when it is created, before calling `task:start`
					},
					terminal = {
						name = "Main Terminal",
						prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
						split_direction = "horizontal", -- "horizontal", "vertical"
						split_size = 11,

						-- Window handling
						single_terminal_per_instance = true, -- Single viewport, multiple windows
						single_terminal_per_tab = true, -- Single viewport per tab
						keep_terminal_static_location = true, -- Static location of the viewport if avialable

						-- Running Tasks
						start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
						focus = false, -- Focus on terminal when cmake task is launched.
						do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
					}, -- terminal executor uses the values in cmake_terminal
				},
			},
			cmake_runner = { -- runner to use
				name = "terminal", -- name of the runner
				opts = {}, -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
				default_opts = { -- a list of default and possible values for runners
					quickfix = {
						show = "always", -- "always", "only_on_error"
						position = "belowright", -- "bottom", "top"
						size = 10,
						encoding = "utf-8",
						auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
					},
					toggleterm = {
						direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
						close_on_exit = false, -- whether close the terminal when exit
						auto_scroll = true, -- whether auto scroll to the bottom
					},
					overseer = {
						new_task_opts = {
							strategy = {
								"toggleterm",
								direction = "horizontal",
								autos_croll = true,
								quit_on_exit = "success"
							}
						}, -- options to pass into the `overseer.new_task` command
						on_new_task = function(task)
						end, -- a function that gets overseer.Task when it is created, before calling `task:start`
					},
					terminal = {
						name = "Main Terminal",
						prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
						split_direction = "horizontal", -- "horizontal", "vertical"
						split_size = 11,

						-- Window handling
						single_terminal_per_instance = true, -- Single viewport, multiple windows
						single_terminal_per_tab = true, -- Single viewport per tab
						keep_terminal_static_location = true, -- Static location of the viewport if avialable

						-- Running Tasks
						start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
						focus = false, -- Focus on terminal when cmake task is launched.
						do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
					},
				},
			},
			cmake_notifications = {
				runner = { enabled = true },
				executor = { enabled = true },
				spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
				refresh_rate_ms = 100, -- how often to iterate icons
			},
		}
	},
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		keys = {
			{ "<leader>E", "<cmd>:NvimTreeToggle<cr>", desc = " Tree Toggle" }
		},
		opts = {
			filters = {
				dotfiles = false,
				exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
			},
			disable_netrw = true,
			hijack_netrw = true,
			hijack_cursor = true,
			hijack_unnamed_buffer_when_opening = false,
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			view = {
				adaptive_size = false,
				side = "left",
				width = 30,
				preserve_window_proportions = true,
			},
			git = {
				enable = false,
				ignore = true,
			},
			filesystem_watchers = {
				enable = true,
			},
			actions = {
				open_file = {
					resize_window = true,
				},
			},
			renderer = {
				root_folder_label = false,
				highlight_git = false,
				highlight_opened_files = "none",

				indent_markers = {
					enable = false,
				},

				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = false,
					},

					glyphs = {
						default = "󰈚",
						symlink = "",
						folder = {
							default = "",
							empty = "",
							empty_open = "",
							open = "",
							symlink = "",
							symlink_open = "",
							arrow_open = "",
							arrow_closed = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
		},
		config = function(_, opts)
			-- dofile(vim.g.base46_cache .. "nvimtree")
			require("nvim-tree").setup(opts)
		end,
	},

}

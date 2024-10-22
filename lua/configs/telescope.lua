return {
  "telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-telescope/telescope-file-browser.nvim",
  },
  keys = {
    {
      "<leader>fp",
      function()
        local telescope = require "telescope"

        local function telescope_buffer_dir()
          return vim.fn.expand "~/.config/nvim"
        end
        print "Open File Browser in nvim config dir"

        telescope.extensions.file_browser.file_browser {
          path = "~/.config/nvim",
          cwd = telescope_buffer_dir(),
          respect_gitignore = true,
          hidden = true,
          grouped = true,
          previewer = true,
          initial_mode = "normal",
          layout_strategy = "horizontal",
          layout_config = { width = 0.7, height = 25 },
        }
      end,
      desc = "Open File Browser in nvim config dir",
    },
    {
      "<leader>fP",
      function()
        require("telescope.builtin").find_files {
          path = require("lazy.core.config").options.root,
          cwd = require("lazy.core.config").options.root,
        }
      end,
      desc = "To find in plugin file",
    },
    {
      ";ff",
      function()
        local builtin = require "telescope.builtin"
        builtin.find_files {
          path = "%:p:h",
          cwd = vim.fn.expand "%:p:h",
          no_ignore = false,
          hidden = true,
        }
      end,
      desc = "Lists files in your current working directory, respects .gitignore",
    },
    {
      ";b",
      function()
        local builtin = require "telescope.builtin"
        builtin.builtin()
      end,
      desc = "To search in telescope builtin",
    },
    {
      ";k",
      function()
        local builtin = require "telescope.builtin"
        builtin.keymaps()
      end,
      desc = "To search in keymaps",
    },
    -- For git
    {
      "<leader>gs",
      function()
        local builtin = require "telescope.builtin"
        builtin.git_status()
      end,
      desc = "Git status",
    },
    {
      "<leader>gm",
      function()
        local builtin = require "telescope.builtin"
        builtin.git_commits()
      end,
      desc = "Git commits",
    },
    {
      "<leader>gb",
      function()
        local builtin = require "telescope.builtin"
        builtin.git_branches()
      end,
      desc = "Git branches",
    },
    {
      ";g",
      function()
        local builtin = require "telescope.builtin"
        builtin.live_grep {
          -- additional_args = { "--hidden" },
        }
      end,
      desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
    },
    {
      ";;",
      function()
        local builtin = require "telescope.builtin"
        builtin.buffers()
      end,
      desc = "Lists open buffers",
    },
    {
      ";h",
      function()
        local builtin = require "telescope.builtin"
        builtin.help_tags()
      end,
      desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
    },
    {
      ";r",
      function()
        local builtin = require "telescope.builtin"
        builtin.resume()
      end,
      desc = "Resume the previous telescope picker",
    },
    {
      ";d",
      function()
        local builtin = require "telescope.builtin"
        builtin.diagnostics()
      end,
      desc = "Lists Diagnostics for all open buffers or a specific buffer",
    },
    {
      ";ts",
      function()
        local builtin = require "telescope.builtin"
        builtin.treesitter()
      end,
      desc = "Lists Function names, variables, from Treesitter",
    },
    {
      "sf",
      function()
        local telescope = require "telescope"

        local function telescope_buffer_dir()
          return vim.fn.expand "%:p:h"
        end

        telescope.extensions.file_browser.file_browser {
          path = "%:p:h",
          cwd = telescope_buffer_dir(),
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = false,
          initial_mode = "normal",
          layout_config = { height = 40 },
        }
      end,
      desc = "Open File Browser with the path of the current buffer",
    },
    {
      ";fo",
      function()
        local builtin = require "telescope.builtin"
        builtin.oldfiles()
      end,
      desc = "To search files",
    },
  },

  config = function(_, opts)
    local telescope = require "telescope"
    local actions = require "telescope.actions"
    local fb_actions = require("telescope").extensions.file_browser.actions

    opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
<<<<<<< HEAD
=======
      path_display = { "smart" },
>>>>>>> ad009c1 (New config)
      wrap_results = true,
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
      mappings = {
        n = {},
      },
      -- To view image
<<<<<<< HEAD
      -- preview = {
=======
      -- preview =
>>>>>>> ad009c1 (New config)
      --   mime_hook = function(filepath, bufnr, opts)
      --     local is_image = function(filepath)
      --       local image_extensions = { "png", "jpg" } -- Supported image formats
      --       local split_path = vim.split(filepath:lower(), ".", { plain = true })
      --       local extension = split_path[#split_path]
      --       return vim.tbl_contains(image_extensions, extension)
      --     end
      --     if is_image(filepath) then
      --       local term = vim.api.nvim_open_term(bufnr, {})
      --       local function send_output(_, data, _)
      --         for _, d in ipairs(data) do
      --           vim.api.nvim_chan_send(term, d .. "\r\n")
      --         end
      --       end
      --       vim.fn.jobstart({
      --         "catimg",
      --         filepath, -- Terminal image viewer command
      --       }, { on_stdout = send_output, stdout_buffered = true, pty = true })
      --     else
      --       require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
      --     end
      --   end,
      -- },
    })

    opts.pickers = {
      diagnostics = {
        theme = "ivy",
        initial_mode = "normal",
        -- layout_config = {
        --   preview_cutoff = 9999,
        -- },
      },
      oldfiles = {
        initial_mode = "normal",
        -- layout_config = {
        --   preview_cutoff = 9999,
        -- },
      },
    }

    opts.extensions = {
      file_browser = {
        theme = "dropdown",
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = true,
        mappings = {
          -- your custom insert mode mappings
          ["n"] = {
            -- your custom normal mode mappings
            ["N"] = fb_actions.create,
            ["h"] = fb_actions.goto_parent_dir,
            ["/"] = function()
              vim.cmd "startinsert"
            end,
            ["<C-u>"] = function(prompt_bufnr)
              for _ = 1, 10 do
                actions.move_selection_previous(prompt_bufnr)
              end
            end,
            ["<C-d>"] = function(prompt_bufnr)
              for _ = 1, 10 do
                actions.move_selection_next(prompt_bufnr)
              end
            end,
            ["<PageUp>"] = actions.preview_scrolling_up,
            ["<PageDown>"] = actions.preview_scrolling_down,
          },
        },
      },
    }

    telescope.setup(opts)
    require("telescope").load_extension "fzf"
    require("telescope").load_extension "file_browser"
  end,
}

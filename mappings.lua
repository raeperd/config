---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>y"] = { [["+y]], "[Y] with system clipboard" },
    ["<leader>Y"] = { [["+Y]], "[Y] with system clipboard" },
    ["<leader>d"] = { [["_d]], "[Y] with system clipboard" },
    ["q"] = { "<Nop>", "Disable vim macro" },
  },
  v = {
    ["<leader>y"] = { [["+y]], "[Y] with system clipboard" },
    ["<leader>d"] = { [["_d]], "[Y] with system clipboard" },
  },
}

-- more keybinds!
-- https://nvchad.com/docs/config/mappings
M.nvimtree = {
  plugin = true,
  n = {
    ["<leader>ex"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<leader>ef"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files follow=true <CR>", "Find files" },
    ["<leader>fp"] = { "<cmd> Telescope live_grep <CR>", "Find by Grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fc"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "Find in current buffer" },

    -- git
    ["<leader>fgf"] = { "<cmd> Telescope git_files <CR>", "Git commits" },
    ["<leader>fgc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>fgs"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- theme switcher
    ["<leader>ft"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },
  },
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
  n = {
    ["<leader>lgD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },
    ["<leader>lgd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },
    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },
    ["<leader>lgi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },
    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },
    ["<leader>lD"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },
    ["<leader>lrm"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "LSP rename",
    },
    ["<leader>lca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
    ["<leader>lgr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },
    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
    ["<leader>d["] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },
    ["<leader>d]"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },
    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },
    ["<leader>lwa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },
    ["<leader>lwr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },
    ["<leader>lwl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
  },
}

local tmuxKeyMaps = {
  ["<C-h>"] = { "<cmd> NvimTmuxNavigateLeft <CR>", "NvimTmuxNavigateLeft" },
  ["<C-j>"] = { "<cmd> NvimTmuxNavigateDown <CR>", "NvimTmuxNavigateDown" },
  ["<C-k>"] = { "<cmd> NvimTmuxNavigateUp <CR>", "NvimTmuxNavigateUp" },
  ["<C-l>"] = { "<cmd> NvimTmuxNavigateRight <CR>", "NvimTmuxNavigateRight" },
  ["<C-\\>"] = { "<cmd> NvimTmuxNavigateLastActive <CR>", "NvimTmuxNavigateLastActive" },
  ["<C-Space>"] = { "<cmd> NvimTmuxNavigateNext <CR>", "NvimTmuxNavigateNext" },
}
M.tmux = {
  n = tmuxKeyMaps,
  i = tmuxKeyMaps,
  v = tmuxKeyMaps,
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Add breakpoint at line" },
    ["<leader>dB"] = {
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
      end,
      "Add conditional breakpoint at line",
    },
    ["<leader>dc"] = { "<cmd> DapContinue <CR>", "DapContinue" },
    ["<leader>di"] = { "<cmd> DapStepInto <CR>", "DapStepInto" },
    ["<leader>do"] = { "<cmd> DapStepOver <CR>", "DapStepOver" },
    ["<leader>dO"] = { "<cmd> DapStepOut <CR>", "DapStepOut" },
    ["<leader>dx"] = { "<cmd> DapTerminate <CR>", "DapTerminate" },
    ["<leader>dos"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>dl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
  },
}

return M

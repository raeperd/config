---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
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

local tmuxKeyMaps = {
  ["<C-h>"] = {"<cmd> NvimTmuxNavigateLeft <CR>", "NvimTmuxNavigateLeft"},
  ["<C-j>"] = {"<cmd> NvimTmuxNavigateDown <CR>", "NvimTmuxNavigateDown"},
  ["<C-k>"] = {"<cmd> NvimTmuxNavigateUp <CR>", "NvimTmuxNavigateUp"},
  ["<C-l>"] = {"<cmd> NvimTmuxNavigateRight <CR>", "NvimTmuxNavigateRight"},
  ["<C-\\>"] = {"<cmd> NvimTmuxNavigateLastActive <CR>", "NvimTmuxNavigateLastActive"},
  ["<C-Space>"] = {"<cmd> NvimTmuxNavigateNext <CR>", "NvimTmuxNavigateNext"},
}
M.tmux = {
	n = tmuxKeyMaps,
	i = tmuxKeyMaps,
	v = tmuxKeyMaps,
}

return M

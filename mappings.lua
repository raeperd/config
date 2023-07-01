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

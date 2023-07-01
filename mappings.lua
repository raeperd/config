---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
	},
}

-- more keybinds!
M.nvimtree = {
	plugin = true,
	n = {
		["<leader>ex"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
		["<leader>ef"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
	},
}

return M

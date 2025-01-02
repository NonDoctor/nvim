return {
	"distek/panel.nvim",
	config = function()
	       require("panel").setup({
	           size = 15,
	           views = {
	               {
	                   -- the name of the panel view (will also be shown in the winbar)
	                   name = "Terminal",

	                   -- the filetype to lock to the panel
	                   ft = "toggleterm",

	                   -- The open function should return the buffer ID of whatever we want in the panel
	                   open = function()
	                       -- open a new terminal in a split (we *want* to create a new window)
	                       vim.cmd("split +term")

	                       -- Grab the buffer's ID
	                       local bufid = vim.api.nvim_get_current_buf()

	                       -- hide the window (closing could delete the buffer, we don't want that)
	                       vim.api.nvim_win_hide(vim.api.nvim_get_current_win())

	                       -- Plugins would do this for you typically
	                       vim.bo[bufid].filetype = "toggleterm"

	                       -- finally return the new buffer ID
	                       return bufid
	                   end,

	                   -- close is for a specific scenario in which the filetype relies on a specific window
	                   -- Trouble is a good example of this
	                   close = false,

	                   -- Additional window options to apply to the panel when this buffer is focused
	                   wo = {
	                       winhighlight = "Normal:ToggleTermNormal",
	                       number = false,
	                       relativenumber = false,
	                       wrap = false,
	                       list = false,
	                       signcolumn = "no",
	                       statuscolumn = "",
	                   },
	               },
	           }
	       })
	   end
}

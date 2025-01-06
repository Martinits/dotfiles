require("git"):setup()

if os.getenv("YAZI_LEVEL") > "1" then
  ya.notify {
    title = "Nested Yazi",
    content = "You are in a nested Yazi session",
    timeout = 2,
  }
end

require("bookmarks"):setup({
	last_directory = { enable = true, persist = true },
	persist = "vim",
	desc_format = "full",
	file_pick_mode = "hover",
	notify = {
		enable = true,
		timeout = 1,
		message = {
			new = "New bookmark '<key>' -> '<folder>'",
			delete = "Deleted bookmark in '<key>'",
			delete_all = "Deleted all bookmarks",
		},
	},
})

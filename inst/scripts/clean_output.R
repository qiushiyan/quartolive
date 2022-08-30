files <- fs::dir_ls(system.file("app/www", package = "quartolive"), glob = "*.html|pdf")
fs::file_delete(files)

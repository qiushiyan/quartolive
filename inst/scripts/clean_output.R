files <- fs::dir_ls(app_sys("app/www"), glob = "*.html|pdf")
fs::file_delete(files)

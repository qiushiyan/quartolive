s3_upload <- function(file, bucket_name = "quartolive", object_name = NULL) {
  if (is.null(object_name)) {
    object_name <- paste0(Sys.Date(), "/", basename(file))
  }

  result <- try(aws.s3::put_object(file, bucket = bucket_name, object = object_name),
    silent = TRUE
  )
  if (isTRUE(result)) {
    s3_url(object_name, bucket_name)
  } else {
    structure("error uploading to s3", class = "try-error")
  }
}

s3_url <- function(object_name, bucket_name = "quartolive") {
  paste0("https://", bucket_name, ".s3.amazonaws.com/", object_name)
}

local_upload <- function(file) {
  output_base_name <- with_ext(basename(file), ext)
  output_file_copy <- fs::path_join(c(app_sys("app/www"), output_base_name))

  if (!fs::file_exists(output_file_copy)) {
    fs::file_create(output_file_copy)
  }

  fs::file_copy(output_file, output_file_copy, overwrite = TRUE)

  paste0("./www/", output_base_name)
}

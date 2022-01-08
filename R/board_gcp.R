#' Use a Google Cloud Storage board
#'
#' To use a Google Cloud Storage board, you need a Google Cloud Storage bucket and a user
#' with enough permissions to access that bucket. You can sign-up and create
#' those at <https://cloud.google.com/storage/>.
#'
#' @inheritParams board_datatxt
#' @param bucket The name of the GCP bucket.
#' @family boards
#' @examples
#' \dontrun{
#' # the following example requires set-up for GCP
#' board <- board_gcp(bucket = "my-bucket")
#' }
#' @export
board_gcp <- function(
                     bucket = Sys.getenv("GCS_DEFAULT_BUCKET"),
                     cache = NULL,
                     name = "gcp",
                     ...) {
  if (nchar(bucket) == 0) stop("The 'gcp' board requires a 'bucket' parameter.")

  board_datatxt(
    name = name,
    url = "",
    cache = cache,
    headers = gcp_headers,
    needs_index = FALSE,
    bucket = bucket,
    region = region,
    connect = FALSE,
    browse_url = "https://console.cloud.google.com/storage/browser",
    host = "",
    ...
  )
}

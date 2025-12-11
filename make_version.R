# make_version.R
# Generates version.json for the HeMAB dashboard

# If jsonlite isn't installed yet:
# install.packages("jsonlite")

library(jsonlite)

# Path to your dashboard repo
base_dir <- "D:/Git/HeMAB-Dashboard"

# Current time in UTC, ISO 8601 format
now_utc <- format(
  as.POSIXct(Sys.time(), tz = "UTC"),
  "%Y-%m-%dT%H:%M:%SZ"
)

# Build number: e.g. "Build 2025.12.11.01"
build_number <- paste0(
  "Build ",
  format(Sys.Date(), "%Y.%m.%d."),
  "01"
)

# Version – you can bump this manually
version <- "v1.0.0"

# JSON object
version_info <- list(
  last_updated = now_utc,
  build_number = build_number,
  version      = version
)

# Write to version.json (no pretty-print, single line is fine)
out_path <- file.path(base_dir, "version.json")
write_json(version_info, out_path, auto_unbox = TRUE)

cat("Written:", out_path, "\n")
print(version_info)

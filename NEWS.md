# nhanesdata (development version)

* Improved vignettes and README with clearer examples and better documentation.

# nhanesdata 0.1.0 (2025-11-20)

## Breaking changes

* `read_r2()` renamed to `read_nhanes()` to better reflect the function's purpose.

* `pull_nhanes()` no longer exported; end users should use `read_nhanes()` to load data.

## Improvements

* Reduced required dependencies—moved 7 packages to Suggests (janitor, fs, pins, jsonlite, yaml, tools, cli).

* Dataset names are now case-insensitive; use 'demo', 'DEMO', or 'Demo' interchangeably.

* Improved error messages for clearer debugging and better user experience.

* `get_url()` rewritten for better reliability and performance.

## Bug fixes

* Fixed critical bug in `pull_nhanes()` where `save()` was failing with "object not found" error.

* Fixed NULL handling in `term_search()` and `var_search()` to prevent crashes on unexpected API responses.

* Fixed type coercion where Begin.Year column was not being properly converted to numeric format.

# nhanesdata 0.0.0.9000 (2025-11-17)

## New features

* Added automated quarterly data update workflow via GitHub Actions with manual
  trigger capability.

## Initial release

* Initial development version of nhanesdata with core functionality for
  accessing and managing NHANES data.

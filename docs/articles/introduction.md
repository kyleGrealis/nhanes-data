# Introduction to nhanesdata

This vignette shows you how to search for NHANES variables and load
pre-processed datasets using the nhanesdata package.

## Acknowledgments

This package builds on the excellent
[nhanesA](https://cran.r-project.org/package=nhanesA) package, which
provides the foundation for accessing NHANES data through R. We’re
grateful for the nhanesA developers’ work in making CDC data accessible.

The nhanesdata package extends nhanesA by providing:  
- Pre-processed datasets for fast access  
- Automatic harmonization across survey cycles (1999-2021)  
- Convenient search and discovery functions

## Setup

First, load the `nhanesdata` package to get access to all its functions.

``` r
library(nhanesdata)
library(dplyr)
```

## Searching for Data

The package includes several helper functions to find specific NHANES
data. **All functions are case-insensitive!**

- [`term_search()`](https://kyleGrealis.com/nhanesdata/reference/term_search.md):
  Search for a term across variable names and descriptions  
- [`var_search()`](https://kyleGrealis.com/nhanesdata/reference/var_search.md):
  Find the datasets a specific variable belongs to  
- [`get_url()`](https://kyleGrealis.com/nhanesdata/reference/get_url.md):
  Get a direct link to the CDC’s documentation for a data table

For example, let’s find data related to “caffeine”:

``` r
# Search functions are case-insensitive
term_search("caffeine")
term_search("CAFFEINE")  # Same results!
```

## Reading Pre-Processed Data (Recommended)

The primary way to use this package is with
[`read_nhanes()`](https://kyleGrealis.com/nhanesdata/reference/read_nhanes.md),
which loads pre-processed NHANES datasets from cloud storage.

**Why “read_nhanes”?** The datasets are hosted on Cloudflare R2 (cloud
object storage) for fast, reliable worldwide access. No credentials
needed—the function downloads and reads the data in one step.

### Benefits:

- **Fast downloads** from cloud storage (hosted on Cloudflare R2)  
- **All survey cycles (1999-2021)** already merged  
- **Type inconsistencies** already resolved  
- **Updated quarterly** via automated workflows  
- **Case-insensitive dataset names** - use ‘demo’, ‘DEMO’, or ‘Demo’
  interchangeably!

### Example:

``` r
# All case variations work identically:
trigly <- read_nhanes('trigly')    # Lowercase (easiest to type)
demo <- read_nhanes('DEMO')        # Uppercase (matches CDC docs)
bpx <- read_nhanes('Bpx')          # Mixed case (because you can!)

head(trigly)
```

**Note:** Each dataset includes a `year` column that identifies which
survey cycle each row came from.

## Important: 2019-2020 Survey Cycle

The 2019-2020 survey cycle (suffix K) is **not included** in the
datasets provided by this package.

The COVID-19 pandemic disrupted data collection during this cycle, and
the CDC determined that the data quality was insufficient for standard
NHANES analysis. The CDC combined partial 2019-2020 data with 2021-2023
data and released it as a special pre-pandemic dataset.

**Reference:** [CDC NHANES 2019-2020 Data
Documentation](https://wwwn.cdc.gov/nchs/nhanes/continuousnhanes/default.aspx?BeginYear=2019)

**What this means:** Datasets jump from suffix J (2017-2018) to suffix L
(2021-2023), skipping K entirely.

## Working with Multiple Datasets

A common workflow is to load and join multiple related datasets:

``` r
library(nhanesdata)
library(dplyr)

# Dataset names are case-insensitive - mix freely!
demo <- read_nhanes('demo')        # Lowercase
bpx <- read_nhanes('BPX')          # Uppercase
bmx <- read_nhanes('Bmx')          # Mixed case

# Join by participant ID (seqn) and survey year
analysis_data <- demo |>
  inner_join(bpx, by = c('seqn', 'year')) |>
  inner_join(bmx, by = c('seqn', 'year')) |>
  select(year, seqn, ridageyr, riagendr, bpxsy1, bmxbmi)
```

The `year` column ensures you only join observations from the same
survey cycle.

## Filtering by Survey Year

Since datasets include all cycles, you can filter to specific time
periods:

``` r
# Load demographics
demo <- read_nhanes('demo')

# Filter to recent cycles only (2015 and later)
recent_demo <- demo |>
  filter(year >= 2015)

# Compare across time periods
demo |>
  mutate(
    period = case_when(
      year < 2010 ~ '1999-2009',
      year < 2020 ~ '2010-2019',
      TRUE ~ '2020+'
    )
  ) |>
  group_by(period) |>
  summarise(n_participants = n())
```

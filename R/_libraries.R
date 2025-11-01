suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(conflicted))
suppressPackageStartupMessages(library(arrow))
suppressPackageStartupMessages(library(broom))
suppressPackageStartupMessages(library(janitor))
suppressPackageStartupMessages(library(foreign))
suppressPackageStartupMessages(library(glue))
suppressPackageStartupMessages(library(gtsummary))
suppressPackageStartupMessages(library(gt))
suppressPackageStartupMessages(library(haven))
suppressPackageStartupMessages(library(nhanesA))
suppressPackageStartupMessages(library(readxl))
suppressPackageStartupMessages(library(remotes))
suppressPackageStartupMessages(library(survey))
suppressPackageStartupMessages(library(srvyr))
suppressPackageStartupMessages(library(tidymodels))

tidymodels_prefer()

if (!suppressPackageStartupMessages(require(MEPS))) {
  remotes::install_github("e-mitchell/meps_r_pkg/MEPS")
}
suppressPackageStartupMessages(library('MEPS'))

# for gtsummary table styling
if (!suppressPackageStartupMessages(require(sumExtras))) {
  remotes::install_github("kyleGrealis/sumExtras")
}
# Don't suppress package message regarding theming!
library('sumExtras')

suppressMessages(conflicted::conflict_prefer("filter", "dplyr"))

# Misc table tweaks
date <- Sys.Date() |> format("%B %d, %Y")
subtitle <- glue("Processed: {date}")

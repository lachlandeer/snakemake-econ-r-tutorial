# Using `rticles` templates with `bookdown`

* Contact: @lachlandeer

## What this Repo does
The `bookdown` package is a great way to build articles when we want sections split over many Rmd files.
`rtciles` provides latex templates that integrate seamlessly with Rmds.
In Yihui's book he provides a brief example of how to inetgrate the two.
This repo provides a slightly more detailed version, and build them with Snakemake.

Different branches contain working examples for alternative `rtcile` templates.
Currently I have implemented this for:

* aea_article
* elsevier_article

## Installing relevant packages:

1. From CRAN, install `rtciles` and `bookdown`
2. Install `Snakemake` from Python 3 to build workflow
3. You need a `TeX` Installation for your OS

## Building the repository:

1. Change into this directory in a terminal
2. In the terminal enter `snakemake all` and press `RETURN`

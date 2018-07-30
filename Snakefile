# Book: snakemake-econ-r-tutorial
#
#
# contributors: @lachlandeer & julianlanger

import glob, os

# --- PROJECT NAME --- #

PROJ_NAME = "snakemake-econ-r-tutorial"

# --- Dictionaries --- #
RMD_FILES  = glob.glob("*.Rmd")
YAML_FILES = glob.glob("*.yml")
CSS_FILES  = glob.glob("*.css")
BIB_FILES  = glob.glob("*.bib")
TEX_FILES  = glob.glob("*.tex")
CLS_FILES  = glob.glob("*.cls")

# --- Variable Declarations ---- #
runR = "Rscript --no-save --no-restore --verbose"
logAll = "2>&1"

# --- Build Rules --- #

rule all:
    input:
        pdf  = "docs/book.pdf",
        html = "docs/index.html"
    output:
        pdf  = "docs/" + PROJ_NAME + ".pdf",
    shell:
        "cp {input.pdf} {output.pdf}"

rule pdf:
    input:
        text_files = RMD_FILES,
        yaml_files = YAML_FILES,
        biblo      = BIB_FILES,
        tex_style  = TEX_FILES,
        #cls_file   = CLS_FILES,
        runner     = "build_pdfbook.R"
    output:
        "docs/book.pdf"
    log:
        "log/build_pdf.Rout"
    shell:
        "{runR} {input.runner} > {log} {logAll}"

rule html:
    input:
        text_files = RMD_FILES,
        yaml_files = YAML_FILES,
        biblo      = BIB_FILES,
        css_style  = CSS_FILES,
        runner     = "build_htmlbook.R"
    output:
        "docs/index.html"
    log:
        "log/build_html.Rout"
    shell:
        "{runR} {input.runner} > {log} {logAll}"

rule clean:
    shell:
        "rm -rf _book/* bookdown_files/* *.pdf *.html"

# Endopep peaks

Simplifies a multitab Bruker spreadsheet into a single spreadsheet

## Installation

    cpanm -l ~ --installdeps .
    perl Makefile.PL
    make
    make install

## Usage

Preparation; loading the environment

    source scripts/environment.sh

Sends a tsv file to stdout

    perl scripts/parseBruker.pl exampleData/02.24.20/022420_JD_raw.xlsx > spreadsheet.tsv


# Endopep peaks

Simplifies a multitab Bruker spreadsheet into a single spreadsheet

## Installation

    mkdir ~/bin
    cd ~/bin
    git clone https://github.com/lskatz/endopep_peaks.git
    cd endopep_peaks
    source scripts/environment.sh
    cpanm -l ~ --installdeps .
    perl Makefile.PL
    make

## Usage

Preparation; loading the environment

    source ~/bin/endopep_peaks/scripts/environment.sh

Sends a tsv file to stdout

    parseBruker.pl exampleData/02.24.20/022420_JD_raw.xlsx > spreadsheet.tsv


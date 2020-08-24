#!/bin/bash

# this directory doesn't evaluate correctly with dirname $0
# when being called with 'source ___.sh' and so here is a one-liner
# https://stackoverflow.com/a/246128
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

module purge
module load perl/5.16.1-MT

export PATH=$PATH:$DIR


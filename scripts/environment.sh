#!/bin/bash
module purge
module load perl/5.16.1-MT

export PATH=$PATH:$(dirname $0)

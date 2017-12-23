#!/bin/bash
cd "${0%/*}"
./init.sh
./apply-patches.sh
./compile.sh

#!/bin/bash
prefix='/nas/homes/annashch/H4K20me1'
fastqc $prefix/Old-H4K20me1-1/*gz
fastqc $prefix/Old-H4K20me1-2/*gz
fastqc $prefix/Old-H4K20me1-3/*gz
fastqc $prefix/Young-H4K20me1-1/*gz
fastqc $prefix/Young-H4K20me1-2/*gz
fastqc $prefix/Young-H4K20me1-3/*gz


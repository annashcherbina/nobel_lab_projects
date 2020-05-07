#!/bin/bash
caper submit /opt/chip-seq-pipeline2/chip.wdl -i pipeline.Old.json
caper submit /opt/chip-seq-pipeline2/chip.wdl -i pipeline.Young.json


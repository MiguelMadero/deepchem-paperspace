#!/bin/bash

. /miniconda/etc/profile.d/conda.sh
conda activate deepchem
# export PATH="/miniconda/envs/deepchem/bin:${PATH}"
jupyter notebook --allow-root --ip=0.0.0.0 --no-browser --NotebookApp.trust_xheaders=True --NotebookApp.disable_check_xsrf=False --NotebookApp.allow_remote_access=True --NotebookApp.allow_origin='*'^C --notebook-dir=./notebooks

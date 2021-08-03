FROM deepchemio/deepchem:2.5.0
# expose jupyter
EXPOSE 8888/tcp
# we can't `conda activate` inside of paperspace so switch back to the base 
# to then reinstall everything in that env

# RUN pip install tensorflow~=2.4
RUN . /miniconda/etc/profile.d/conda.sh && \
    conda activate deepchem && \
    conda install -y -c conda-forge notebook
# RUN conda install -y -c conda-forge rdkit
# RUN conda install -y -c conda-forge deepchem=2.5 

# RUN pip install tensorflow-gpu~=2.4 && \
#     conda install -y -c conda-forge notebook && \
#     conda install -y -c conda-forge deepchem && \
#     conda install -y -c conda-forge rdkit

# RUN conda init bash && \
    # echo "conda activate" >> ~/.bashrc && \
    # ~/.bashrc && \
    # conda activate base && \
    # conda install -y -c conda-forge deepchem rdkit notebook     
ADD ./scripts ./scripts/
ADD ./notebooks ./notebooks
CMD ./scripts/run.sh

FROM deepchemio/deepchem:2.5.0
# expose jupyter
EXPOSE 8888/tcp
# we can't `conda activate` inside of paperspace so we change the path 
ENV PATH="/miniconda/envs/deepchem/bin:${PATH}"

RUN conda install -c conda-forge notebook && \
    conda init bash && \
    echo "conda activate" >> ~/.bashrc
ADD ./docker ./
CMD ./run.sh
# CMD /bin/bash jupyter notebook --allow-root --ip=0.0.0.0 --no-browser --NotebookApp.trust_xheaders=True --NotebookApp.disable_check_xsrf=False --NotebookApp.allow_remote_access=True --NotebookApp.allow_origin='*'^C
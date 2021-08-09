# Deepchem in Paperspace

This repo includes a docker image meant to be used in paperspace when working with [deepchem](https://deepchem.io/), it may work in other cloud/jupyter environments but it hasn't been tested. The repo contains notebooks for each of the chapters so you can use it as a starting point if you're going through the book. For the official source code from the book, please refer to [deepchem/DeepLearningLifeSciences](https://github.com/deepchem/DeepLearningLifeSciences). 

Is this needed? No, you may prefer to do this all locally or in your own cloud setup. You can follow the instructions on https://deepchem.io/ 
Is this better? There are trade-offs to both approaches. A custom cloud or local setup may be more work for some. This helps you focus on developing or going through the book exercises without having to spend time setting up an environment. 
Is this faster? Depending on your setup, this may be a lot faster since paperspace has free GPUs you can also pay for larger units. Doing everything on a standard laptop will get you 80% there when going through the book and won't be enough for any serious work. 

## Running in paperspace

1. Create a [paperspace](https://console.paperspace.com/) account
1. Go to the [console](https://console.paperspace.com/) and click on create
1. Select a name, machine (suggest free GPU), toggle the advanced options and enter the following values: 
* Workspace URL: https://github.com/MiguelMadero/deepchem-paperspace
    This repo will include the Deepchem exercises from the book and the tutorials from deepchem.io (someday?)
* Container name: `mamadero/deepchem-jupyter`
* Command: `./scripts/run.sh`
Leave the rest blank

## Build the docker image locally

1. Clone this repo and cd into it 
```
git clone git@github.com:MiguelMadero/deepchem-paperspace.git && cd deepchem-paperspace.git
```
2. Docker build
```
docker build -t mamadero/deepchem-jupyter .
```

## Run docker locally 

1. Follow the steps to on [Build][#build-the-docker-image-locally] or just pull it from dockerhub `docker pull mamadero/deepchem-jupyter`
2. Run docker localy opening port 8888. 
```
docker run -p 8888:8888 -it mamadero/deepchem-jupyter
```
Or mount a volume with your notebooks
```
docker run -v ${PWD}/notebooks:/workingdir/root/notebooks/ -p 8888:8888 -it mamadero/deepchem-jupyter
```
Or start a bash session to devbug
```
docker run -p 8888:8888 -v ${PWD}/notebooks:/workdir/notebooks/ -it mamadero/deepchem-jupyter /bin/bash
```
Once in there you can start jupyter by running 
```
./scripts/run.sh
```



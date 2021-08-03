# Deepchem in Paperspace

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



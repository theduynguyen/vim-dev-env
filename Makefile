help:
	@cat Makefile

DATA?="${HOME}/data"
WORK?="${HOME}/work"
SRC="${HOME}/projects"
GPU?=0
DOCKER_FILE=Dockerfile
DOCKER_IMAGE=theduynguyen/dl-dev-vim
DOCKER=GPU=$(GPU) nvidia-docker

build:
	docker build -t theduynguyen/dl-dev-vim -f $(DOCKER_FILE) .

bash: build
	$(DOCKER) run -it -v $(SRC):/src -v $(DATA):/data -v $(WORK):/work -p 6006:6006 theduynguyen/dl-dev-vim bash 

ipython: build
	$(DOCKER) run -it -v $(SRC):/src -v $(DATA):/data -v $(WORK):/work -p 6006:6006 theduynguyen/dl-dev-vim ipython

notebook: build
	$(DOCKER) run -it -v $(SRC):/src -v $(DATA):/data -v $(WORK):/work -p 8888:8888 theduynguyen/dl-dev-vim  

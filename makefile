#SHELL := /bin/bash

CODE_DIR=build/code
DOCS_DIR=build/docs
PWD=$(shell pwd)
STATUS=0

all:  post-build

init: 
	./init.sh

build: init
	make -f tangle-make -k all

post-build: build

	if [ ! -d "${CODE_DIR}/simulation/static/img" ]; then
		mkdir -p ${CODE_DIR}/simulation/static/img
	fi

	rsync -a ${DOCS_DIR}/simulation/static/img/ ${CODE_DIR}/simulation/static/img/
	rsync -a ${DOCS_DIR}/simulation/static/js/ ${CODE_DIR}/simulation/static/js/
	rsync -a ${DOCS_DIR}/simulation/static/css/ ${CODE_DIR}/simulation/static/css/

clean:	
	make -f tangle-make clean

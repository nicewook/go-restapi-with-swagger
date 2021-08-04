MAKE=make
GO=go
SWAGGER=swagger

# export CGO_ENABLED := 1
# export CC := aarch64-linux-android-gcc
# export CXX := aarch64-linux-android-g++

# export GOOS := android
# export GOARCH := arm64


# ifdef OS
# 	GOPATH = $(CURDIR)\..\..\.
# else
# 	ifeq ($(shell uname), Linux)
# 		export GOPATH = $(abspath $(dir $(lastword $(MAKEFILE_LIST)))/../../)
#    endif
# endif


.PHONY: swagger.validate # validate swagger yaml
swagger.validate:  
	$ swagger validate pkg/swagger/swagger.yml

.PHONY: swagger.doc # validate swagger yaml
swagger.doc:  
	$ docker run -i yousan/swagger-yaml-to-html < pkg/swagger/swagger.yml > doc/index.html



all:
	@echo hello
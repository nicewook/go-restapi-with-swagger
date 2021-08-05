ifeq ($(OS),Windows_NT)
  RMDIR=rmdir /S /Q
	MKDIR=mkdir
else
  RMDIR=rm -rf
	MKDIR=mkdir -p
endif


.PHONY: swagger.validate # validate swagger yaml
swagger.validate:
	swagger validate pkg/swagger/swagger.yml

.PHONY: swagger.doc # make index.html - could be removed to use GitHub Action or leave it still
swagger.doc:
	docker run -i yousan/swagger-yaml-to-html < pkg/swagger/swagger.yml > doc/index.html

.PHONY: swagger.gen # generate go files from the yaml
swagger.gen:
	if exist pkg\swagger\server ( $(RMDIR) pkg\swagger\server )
	$(MKDIR) pkg\swagger\server
	go generate github.com/nicewook/go-rest-api-server/pkg/swagger


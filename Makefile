.PHONY: run build build-alpine build-docker push-gcr deploy

run:
	go build -o ./api && ./api

build:
	go build -o ./api

build-alpine:
	CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o ./api

build-docker:
	docker build -f Dockerfile -t gcr.io/sample-google-project/api:latest .

push-gcr:
	gcloud docker -- push gcr.io/sample-google-project/api:latest

deploy:
	kubectl apply -f ./kubeconfigs

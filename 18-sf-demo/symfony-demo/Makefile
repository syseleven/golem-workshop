VERSION=1.0.0

test:
	./vendor/bin/simple-phpunit
	helm lint helm/symfony-demo
	helm kubeval helm/symfony-demo
	hadolint Dockerfile

build:
	docker build --target fpm -t bashofmann/k8s-workshop-syfmony-demo-fpm:$(VERSION) .
	docker build --target nginx -t bashofmann/k8s-workshop-syfmony-demo-nginx:$(VERSION) .

push:
	docker push bashofmann/k8s-workshop-syfmony-demo-fpm:$(VERSION)
	docker push bashofmann/k8s-workshop-syfmony-demo-nginx:$(VERSION)

run: stop start

push: stop start
	docker build -t mikenieto/backendapp .;
	docker push mikenieto/backendapp

stop:
	docker stop backTest || true;

start:
	gradle clean bootJar;
	docker build -t mikenieto/backendapp .;
	docker run -d -p 8082:8082 --rm --name backTest -t mikenieto/backendapp

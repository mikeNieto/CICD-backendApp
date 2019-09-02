run: stop start

stop:
	docker stop backTest; \
	docker rm backTest

start:
	gradle clean bootJar; \
	docker build -t mikenieto/backendapp .; \
	docker run -p 8082:8082 --name backTest -t mikenieto/backendapp

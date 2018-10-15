REGISTRY = quay.io/garyellis
IMAGE = $(REGISTRY)/aws-efs-utils:0.1.0
LATEST = $(REGISTRY)/aws-efs-utils:latest

build:
	docker run \
		--rm \
		-v $$(pwd):/build \
		centos:7 \
		/bin/bash -c "yum -y install git make rpm-build && git clone https://github.com/aws/efs-utils /build/efs-utils && cd /build/efs-utils && make rpm"



build-container:
	docker build -t $(LATEST) .
	docker tag $(LATEST) $(IMAGE)


push:
	docker push $(IMAGE)
	docker push $(LATEST)


clean:
	rm -fr efs-utils

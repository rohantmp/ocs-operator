#!/bin/bash

set -eu

export IMAGE_REGISTRY="index.docker.io"
export REGISTRY_NAMESPACE="rohantmp"
export IMAGE_TAG="11"
echo "TAG: ${IMAGE_TAG}"
PUSH_TAG="${IMAGE_REGISTRY}/${REGISTRY_NAMESPACE}/ocs-registry:${IMAGE_TAG}"

vim gen.sh &&
	bash tags/get.sh &&
	vim hack/generate-latest-csv.sh &&
	make gen-latest-csv && 
	vim deploy/olm-catalog/ocs-operator/4.3.0/ocs-operator.v4.3.0.clusterserviceversion.yaml && 
	echo "notpushed" > pushed.txt &&
	make ocs-registry
success=${PIPESTATUS[0]} 
if [[ ${success} -ne 0 ]]
then
	exit $success
else
	echo "[Build success]"
fi

docker push $PUSH_TAG && echo pushed > pushed.txt

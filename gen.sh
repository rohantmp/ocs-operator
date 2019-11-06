vim gen.sh &&
	bash tags/get.sh
	vim hack/generate-latest-csv.sh &&
	make gen-latest-csv && 
	vim deploy/olm-catalog/ocs-operator/4.3.0/ocs-operator.v4.3.0.clusterserviceversion.yaml && 
	make ocs-registry

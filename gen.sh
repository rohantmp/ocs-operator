vim hack/generate-latest-csv.sh &&
	make gen-latest-csv && 
	vim deploy/olm-catalog/ocs-operator/0.0.1/ocs-operator.v0.0.1.clusterserviceversion.yaml && 
	make ocs-registry

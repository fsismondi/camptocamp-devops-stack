#!/bin/sh

cd terraform || exit
terraform init -upgrade
terraform workspace select "$CLUSTER_NAME" || terraform workspace new "$CLUSTER_NAME"
terraform init -upgrade
terraform destroy --auto-approve
if [ "$CLUSTER_NAME" != "default" ]; then
	terraform workspace select master
	terraform workspace delete "$CLUSTER_NAME"
fi

#!/usr/bin/env bash
set -e

cd "${0%/*}"

. "build_variables.sh"

cd $PROJECT_DIR


function create_yaml()
{
  local template=$1
  local output=$2
  source /dev/stdin <<<"$(echo "cat <<EOF >$output"; cat $template; echo EOF;)"
}

echo "TAGGING IMAGE $CONTAINER_NAME WITH $TAG"
docker tag $CONTAINER_NAME $TAG

echo "PUSHING IMAGE $TAG"
docker push $TAG

echo "CREATING YAML FILES FOR DEPLOYMENT"
create_yaml application_template.yaml application.yaml
create_yaml application_ingress_template.yaml application_ingress.yaml

echo "EXECUTING DEPLOYMENT"
kubectl create -f application.yaml
kubectl apply -f application_ingress.yaml

echo "CLEAN UP OF GENERATED YAML FILES"
rm -f application.yaml
rm -f application_ingress.yaml

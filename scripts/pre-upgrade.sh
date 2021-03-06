#! /bin/bash
set -ex

if [ "$#" -ne 2 ]; then
        echo "Error : Invalid number of arguments"
        Usage: "./pre-upgrade.sh <bookkeeper-operator-release-name> <bookkeeper-operator-namespace>"
        exit 1
fi

name=$1
namespace=$2

kubectl annotate Service bookkeeper-webhook-svc meta.helm.sh/release-name=$name -n $namespace --overwrite
kubectl annotate Service bookkeeper-webhook-svc meta.helm.sh/release-namespace=$namespace -n $namespace --overwrite
kubectl label Service bookkeeper-webhook-svc app.kubernetes.io/managed-by=Helm -n $namespace --overwrite


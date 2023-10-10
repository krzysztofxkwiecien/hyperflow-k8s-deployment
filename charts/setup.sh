kind create cluster --config ../local/kind-config-3n.yaml
helm upgrade --dependency-update -i hf-ops hyperflow-ops
helm upgrade --dependency-update -i hf-run-montage hyperflow-run
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.10.2/serving-crds.yaml
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.10.2/serving-core.yaml
kubectl apply -f https://github.com/knative/net-kourier/releases/download/knative-v1.10.0/kourier.yaml
kubectl patch configmap/config-network --namespace knative-serving --type merge --patch '{"data":{"ingress-class":"kourier.ingress.networking.knative.dev"}}'
kubectl edit configmap config-features -n knative-serving

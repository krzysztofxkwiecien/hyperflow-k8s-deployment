kind create cluster --config local/kind-config-3n.yaml
helm upgrade --dependency-update -i hf-ops charts/hyperflow-ops
helm upgrade --dependency-update -i hf-run-montage charts/hyperflow-run

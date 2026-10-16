#!/usr/bin/env bash
# Bonus Kubernetes (opsional): deploy aplikasi Hello World ke Kubernetes (Killercoda).
# Jalankan dari root repositori: bash bonus-kubernetes/deploy.sh

set -e

echo "==== Deploy aplikasi ===="
kubectl apply -f bonus-kubernetes/deployment.yaml
kubectl apply -f bonus-kubernetes/service.yaml

echo
echo "==== Menunggu pod siap ===="
kubectl rollout status deployment/hello-app --timeout=120s

echo
echo "==== Daftar Pod ===="
kubectl get pods -o wide

echo
echo "==== Service ===="
kubectl get svc hello-app

echo
echo "Buka menu Traffic/Ports di Killercoda, pilih Custom Ports, lalu masukkan port 30080."
echo "Uji dari terminal:"
curl -s http://localhost:30080 || echo "Belum bisa diakses dari terminal, coba lewat Traffic/Ports."

echo
echo "==== Uji ketahanan (opsional): hapus satu pod, platform akan membuat ulang ===="
echo "kubectl delete pod \$(kubectl get pods -o name | head -n 1)"
echo "kubectl get pods -w"

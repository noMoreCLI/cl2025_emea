#!/bin/zsh
kubectl sniff -n brkobs-3603-s $(kubectl get pod -n brkobs-3603-s --no-headers | awk '/service-b/ {print $1}') -o - | tshark -O http -Y "http.request.method == \"GET\"" -r -


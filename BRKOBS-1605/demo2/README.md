# Deploy the Demo Application for BRKOBS-1605, Usecase 1
## PreRequisits
AppD in namespace appdynamics
Splunk in namespace splunk

## Create namespace
```shell
kubectl create ns brkobs-1605-demo2
```

## Deploy the Otel components
```shell
kubectl -n brkobs-1605-demo2 apply -f collector
```

This deploys an instrumentation crd in the namespace as well a local collector in the namespace


## Deploy the Application
```shell
kubectl -n brkobs-1605-demo2 apply -f deployment
```

## Patch the Inventory Service for OTel instrumentation
```shell
kubectl patch deployment web-frontend  -n brkobs-1605-demo2 -p '{"spec":{"template":{"metadata":{"annotations":{"instrumentation.opentelemetry.io/inject-java":"true"}}}}}'
kubectl patch deployment account  -n brkobs-1605-demo2 -p '{"spec":{"template":{"metadata":{"annotations":{"instrumentation.opentelemetry.io/inject-java":"true"}}}}}'
kubectl patch deployment inventory  -n brkobs-1605-demo2 -p '{"spec":{"template":{"metadata":{"annotations":{"instrumentation.opentelemetry.io/inject-java":"true"}}}}}'
kubectl patch deployment api  -n brkobs-1605-demo2 -p '{"spec":{"template":{"metadata":{"annotations":{"instrumentation.opentelemetry.io/inject-java":"true"}}}}}'
```

This will send otel to the local collector. the local collector is configured to forward traces, metrics & logs to the splunk collector 

## Rolling update/restart
```shell
for deployment in $(kubectl get deployments -n brkobs-1605-demo2 -o jsonpath='{.items[*].metadata.name}'); do
		  kubectl rollout restart deployment/$deployment -n brkobs-1605-demo2
		done
```
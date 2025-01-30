# Deploy the Demo Application for BRKOBS-1605, Usecase 1
## PreRequisits
AppD in namespace appdynamics
Splunk in namespace splunk

## Create namespace
```shell
kubectl create ns brkobs-1605-demo1
```

## Deploy the Otel components
```shell
kubectl -n brkobs-1605-demo1 apply -f collector
```

This deploys an instrumentation crd in the namespace as well a local collector in the namespace

## Configure AppDynamics Cluster Agent
```yaml
  - appName: BRKOBS-1605-demo1
    language: java
    namespaceRegex: brkobs-1605-demo1
    matchString: ^web-frontend|^account|^api
    tierNameLabel: service
    customAgentConfig: -Dappdynamics.low.entropy=true -Dappdynamics.opentelemetry.enabled=true -Dotel.traces.exporter=otlp -Dotel.resource.attributes=service.name=$(SERVICE_NAME),service.namespace=$(NAMESPACE),k8s.namespace.name=$(NAMESPACE),deployment.environment=$(NAMESPACE),k8s.cluster.name=$(K8S_CLUSTER_NAME) -Dotel.exporter.otlp.endpoint=http://otel-collector:4317
  nsToInstrumentRegex: brkobs-1605-demo1

```

## Deploy the Application
```shell
kubectl -n brkobs-1605-demo1 apply -f deployment
```

## Patch the Inventory Service for OTel instrumentation
```shell
kubectl patch deployment inventory  -n brkobs-1605-demo1 -p '{"spec":{"template":{"metadata":{"annotations":{"instrumentation.opentelemetry.io/inject-java":"true"}}}}}'
```

This will send otel to the local collector. the local collector is configured to forward traces, metrics & logs to the splunk collector 
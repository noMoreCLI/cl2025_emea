# Steps to create demo env
## Prerequisite
K8s cluster
AppD Cluster Agent installed in namespace appdynamcis
Splunk Distribution Otel installed in namespace splunk

## Create Namespace for the Application

kubectl create ns brkobs-3603-s

## Deploy the application

kubectl -n brkobs-3603-s apply -f ./deployment

## Deploy the Otel Collector
kubectl -n brkobs-3603-s apply -f ./otel  

## Deploy the Otel Autoinstrumentation Config

## Annotate the service-b
kubectl patch deployment service-b -n brkobs-3603-s -p '{"spec":{"template":{"metadata":{"annotations":{"instrumentation.opentelemetry.io/inject-java":"true"}}}}}'

## Setup AppD autoinstrumentation

add the following to the instrumentation rules

```yaml
  - appName: BRKOBS-3603-s
    language: java
    namespaceRegex: brkobs-3603-s
    matchString: ^service-a|^service-c
    tierNameLabel: service
    customAgentConfig: -Dappdynamics.low.entropy=true -Dappdynamics.opentelemetry.enabled=true -Dotel.traces.exporter=otlp -Dotel.resource.attributes=service.name=$(SERVICE_NAME),service.namespace=$(NAMESPACE),k8s.namespace.name=$(NAMESPACE),deployment.environment=$(NAMESPACE),k8s.cluster.name=$(K8S_CLUSTER_NAME) -Dotel.exporter.otlp.endpoint=http://otel-collector:4317
```

add the namespace to the instrumented namespaces
```yaml
nsToInstrumentRegex: astoklas-otel1|astoklas-otel3|cl2025-1|petclinic-appd|brkobs-3603-s
```

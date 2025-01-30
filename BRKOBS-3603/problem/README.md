# Steps to create demo env
## Prerequisite
K8s cluster
AppD Cluster Agent installed in namespace appdynamcis
Splunk Distribution Otel installed in namespace splunk

## Create Namespace for the Application

kubectl create ns brkobs-3603-p

## Deploy the application

kubectl -n brkobs-3603-p apply -f ./deployment

## Setup AppD autoinstrumentation

add the following to the instrumentation rules

```yaml
  - appName: BRKOBS-3603-p
    language: java
    namespaceRegex: brkobs-3603-p
    matchString: ^service-a|^service-c
    tierNameLabel: service
```

add the namespace to the instrumented namespaces
```yaml
nsToInstrumentRegex: astoklas-otel1|astoklas-otel3|cl2025-1|petclinic-appd|brkobs-3603-p
```

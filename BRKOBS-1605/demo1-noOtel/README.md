# Deploy the Demo Application for BRKOBS-1605, Usecase 1
## PreRequisits
AppD in namespace appdynamics
Splunk in namespace splunk

## Create namespace
```shell
kubectl create ns brkobs-1605-nootel
```

This deploys an instrumentation crd in the namespace as well a local collector in the namespace

## Configure AppDynamics Cluster Agent
```yaml
  - appName: BRKOBS-1605-noOtel
    language: java
    namespaceRegex: brkobs-1605-nootel
    matchString: ^web-frontend|^account|^api
    tierNameLabel: service
  nsToInstrumentRegex: brkobs-1605-nootel

```

## Deploy the Application
```shell
kubectl -n brkobs-1605-nootel apply -f deployment
```

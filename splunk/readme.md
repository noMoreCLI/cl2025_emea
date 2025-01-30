# Installing Splunk Monitoring
```shell
helm repo add splunk-otel-collector-chart https://signalfx.github.io/splunk-otel-collector-chart
helm repo update
kubectl create ns splunk
helm upgrade --install splunk-otel-collector -f values-cl2025.yaml -n splunk splunk-otel-collector-chart/splunk-otel-collector
```

kubectl patch deployment <my-deployment> -n <my-namespace> -p '{"spec":{"template":{"metadata":{"annotations":{"instrumentation.opentelemetry.io/inject-dotnet":"default/splunk-otel-collector","instrumentation.opentelemetry.io/otel-dotnet-auto-runtime":"linux-x64"}}}}}'

kubectl patch deployment <my-deployment> -n <my-namespace> -p '{"spec":{"template":{"metadata":{"annotations":{"instrumentation.opentelemetry.io/inject-dotnet":"default/splunk-otel-collector","instrumentation.opentelemetry.io/otel-dotnet-auto-runtime":"linux-musl-x64"}}}}}'

kubectl patch deployment <my-deployment> -n <my-namespace> -p '{"spec":{"template":{"metadata":{"annotations":{"instrumentation.opentelemetry.io/inject-java":"default/splunk-otel-collector"}}}}}'

kubectl patch deployment <my-deployment> -n <my-namespace> -p '{"spec":{"template":{"metadata":{"annotations":{"instrumentation.opentelemetry.io/inject-nodejs":"default/splunk-otel-collector"}}}}}'



helm install splunk-otel-collector --set="

cloudProvider=aws,
distribution=eks,
splunkObservability.accessToken=UspLDxPHWC5WAgn8jOks2w,
clusterName=CiscoLive2025,
splunkObservability.realm=us1,
gateway.enabled=false,
splunkObservability.profilingEnabled=true,
environment=CiscoLive2025,
operator.enabled=true,
certmanager.enabled=true,
agent.discovery.enabled=true" 

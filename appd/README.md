# 1
Modify the cluster agent template file `ca.yaml.template` and add our information of controller, account and global account.

# 2
Install the cluster agent in the cluster. This is not intended to be installed in an environment where clusterAgent is already running

For the installation, follow the instructions in the documentation
https://docs.appdynamics.com/appd/24.x/latest/en/infrastructure-visibility/monitor-kubernetes-with-the-cluster-agent/install-the-cluster-agent/install-the-cluster-agent-with-helm-charts

## Debugging auto-instrumentation with the cluster agent

```shell
kubectl -n appdynamics logs $(kubectl get pod -n appdynamics --no-headers | awk '/cluster-agent/ {print $1}') -f | grep -E 'instrumentationconfig.go|deploymenthandler.go'
```

## Upgrading/Installing the cluster agent with a new values file
```shell
helm upgrade --install -f ca.yaml ciscolive2025 appdynamics-cloud-helmcharts/cluster-agent --namespace=appdynamics
```

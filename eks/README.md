# Create EKS Cluster to run demo applications

## 1) Create Cluster
```shell
eksctl create cluster -f cluster.yaml
```

### Delete Cluster
```shell
eksctl delete cluster CiscoLive2025 --region eu-central-1
```

### Scale Cluser
```shell
eksctl scale nodegroup --cluster CiscoLive2025 --region eu-central-1 --name nodegroupmedium --nodes 0 --nodes-min 0 --nodes-max 3 
```

## 2) Install AppD ClusterAgent

## 3) Install Splunk OTel Distribution


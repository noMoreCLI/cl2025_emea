# Cisco Live 2025 EMEA Environment Recreation

Welcome to the repository dedicated to recreating the environment used during Cisco Live 2025 EMEA in Amsterdam for sessions BRKOBS-1605 and BRKOBS-3603.

## Overview

This repository contains all the necessary deployment files and templates to set up and run the demo applications showcased during the sessions. Our aim is to provide you with a seamless experience in replicating the environment.

## Preequisites

- AppDynamcis Controller
- Splunk Observability Cloud
- AWS account for creating an EKS cluster
- helm & kubectl to interact with the cluster
- (optional) K9S - The Norton Commander for K8s (Only for the ones old enough to remember ;)  

## Contents
### Deployment Files

The deployment files for the demo applications are organized into specific subfolders. Navigate through these folders to find the files relevant to each application.
Amazon EKS Cluster

For Cisco Live, we utilized a 4-node Amazon EKS cluster. You can find a template to replicate this setup in the eks folder. Use this template as a foundation to create your own cluster environment.
Application Monitoring
- AppDynamics Cluster Agent: The configuration files for the AppDynamics Cluster Agent are located in their designated directory. You will need to modify these files with your specific AppDynamics controller information.
- Splunk OpenTelemetry Collector: Similarly, the distribution for the Splunk OpenTelemetry Collector can be found in its respective folder. Ensure you update the template files with details from your Splunk Observability Cloud instance.

### Getting Started

To get started, clone this repository and follow the instructions contained within each subfolder. Make sure to adjust the configuration files with your environment-specific details.

### Additional Information

The command example need to be adapted to your naming of the value yaml files

For detailed instructions and advanced configurations, please refer to the official product documentation provided by AppDynamics and Splunk. These resources will provide you with comprehensive guidance on setting up and managing the monitoring tools effectively.

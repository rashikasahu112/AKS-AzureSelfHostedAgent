# Azure Self-Hosted Agent Deployment on Azure Kubernetes Service (AKS)

## Overview
This repository contains scripts and configurations for deploying Azure Self-hosted agents on Azure Kubernetes Service (AKS) capable of supporting multiple frameworks including .NET, Java, and React applications. These agents can be used to execute workloads and build/deploy applications.

## Components Used

**Azure DevOps:** Utilized as the CI/CD tool for automating the build, test, and deployment processes.

**Azure Self-Hosted Agents:** Components belonging to Azure DevOps, used to execute pipelines within your own infrastructure.

**Azure Kubernetes Service (AKS):** A managed container orchestration tool used to deploy and manage containerized applications.

**Terraform:** An infrastructure as code tool utilized to deploy the infrastructure via scripts.

**Docker:** A containerization tool used to package applications along with their dependencies in isolated environments.

**Azure Container Registry (ACR):** Used to host Docker images containing the application and its dependencies.


## Deployment Steps

**Deploy Azure Container Registry(ACR):** Utilized Terraform scripts to provision the infrastructure component.

**Build & Push Docker Image to ACR:** Deployed the Self-Hosted Agent on AKS by creating a Docker image containing all the configurations required for setup.

**Provision AKS Cluster:** Terraform scripts to provision an AKS cluster and attach it to ACR for docker image access. Utilized Managed Identity to attach AKS with ACR.

**Confgure AKS:** Deployed the Self-Hosted Agent on AKS using Kubernetes Manifest and the previously built Docker image. Created Deployment Object to deploy the pods and Secrets to securely store crucial information required for setting up the Self-Hosted Agent.

**Execute Workloads:** With all the above steps completed, the agents are ready to execute your workloads.



## Steps to Reproduce
- Setup a Backend for Terraform State Files
- Establish a Azure Service Connection
- Execute the pipeline
# Online Boutique: End-to-End DevOps Pipeline

This project showcases a complete, production-grade microservices deployment lifecycle, designed to highlight cloud-native architecture, infrastructure automation, and robust observability.

## 🖥️ Final Application Interface

The final output is a fully functional e-commerce application, featuring a smooth user experience and deployed across an automated, highly available AWS EKS cluster.

![Full Website Interface](IMG/google%20botueq.jpg)

*The interface focuses on clear hierarchy and a reliable backend powered by microservices.*

## 🛠️ Tech Stack & Key Features

* **Infrastructure as Code (IaC):** AWS environment provisioned securely with Terraform.
* **GitOps & CI/CD:** Automated deployments using GitHub Actions and ArgoCD.
* **Container Registries:** Dual-registry setup utilizing Docker Hub and AWS ECR.
* **Deep Observability:** Comprehensive monitoring and distributed tracing using Grafana and Tempo.

## 🧩 Key Application Components

The following images illustrate key components of the development process, infrastructure provisioning, and tool integration:

* <img src="IMG/lunch.png" width="48%" alt="Terraform Apply" /> <img src="IMG/argocd.png" width="48%" alt="ArgoCD Sync" />
* <img src="IMG/dockerhub.png" width="48%" alt="Docker Hub" /> <img src="IMG/ecr.png" width="48%" alt="AWS ECR" />
* <img src="IMG/grafna.png" width="48%" alt="Grafana Metrics" /> <img src="IMG/tracid.png" width="48%" alt="Tempo Traces" />
* <img src="IMG/secrets.png" width="48%" alt="GitHub Secrets" />

### Component Details:

Each component serves a specific role in the overall application workflow, from secure secret management and infrastructure creation to continuous deployment and granular system monitoring, ensuring easy maintenance and scalability.

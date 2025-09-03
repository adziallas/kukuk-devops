# Kukuk DevOps – Microservice CI/CD auf Kubernetes

Dieses Repo enthält ein Spring-Boot-Backend und ein statisches Frontend mit Jenkins-basierter CI/CD-Pipeline.
Builds werden als Docker-Images versioniert und in **dev** (auto) und **prod** (nach Approval) in Kubernetes ausgerollt.

## Technologien
Java 17 / Spring Boot · Node/Jest · Maven/NPM · Docker · Jenkins · Kubernetes/Kustomize

## Struktur
`backend/`, `frontend/`, `docker/`, `k8s/` (base + overlays `dev`/`prod`), `jenkins/`, `docs/`

## Lokal
Backend: `cd backend && mvn -Pdev spring-boot:run`  
Frontend: `cd frontend && npm ci && npm test && npm run build && npx http-server ./dist -p 8080`

## Kubernetes
`kubectl apply -k k8s/overlays/dev` (Prod via Jenkins nach Approval)

## Rollback
`kubectl -n <ns> rollout undo deployment/<name>`

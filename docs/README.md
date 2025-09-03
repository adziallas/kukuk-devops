# Kukuk DevOps – Microservice CI/CD auf Kubernetes

Dieses Repository enthält ein Spring-Boot-Backend und ein statisches Frontend mit einer durch Jenkins automatisierten CI/CD-Pipeline. Builds werden als Docker-Images versioniert und in **dev** (automatisch) und **prod** (nach Approval) in Kubernetes ausgerollt.

**Technologien:** Java 17/Spring Boot · Node/Jest · Maven/NPM · Docker · Jenkins · Kubernetes/Kustomize

## Ordnerstruktur
- `backend/`, `frontend/`, `docker/`, `k8s/` (base + overlays `dev`/`prod`), `jenkins/`, `docs/`

## Lokal starten
```bash
# Backend
cd backend
mvn -Pdev spring-boot:run

# Frontend
cd ../frontend
npm ci
npm test
npm run build
npx http-server ./dist -p 8080  # optional
```

## Container bauen
```bash
docker build -f docker/backend.Dockerfile -t backend:dev .
docker run -e SPRING_PROFILES_ACTIVE=dev -p 8081:8080 backend:dev

docker build -f docker/frontend.Dockerfile -t frontend:dev .
docker run -p 8080:80 frontend:dev
```

## Kubernetes Deploy
```bash
kubectl apply -k k8s/overlays/dev
kubectl -n dev get pods,svc
```

## CI/CD-Ablauf
Checkout → Build/Test → Docker Build/Push → Deploy dev → Approval → Deploy prod (mit exaktem Tag).

## Konfiguration
Spring-Profile per `SPRING_PROFILES_ACTIVE` (dev=8081, prod=8080).

## Rollback
`kubectl -n <ns> rollout undo deployment/<name>`

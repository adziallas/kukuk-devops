# Präsentations-Kurzfassung

**Ziel:** Vollautomatischer CI/CD-Flow für Microservice-App (Java + JS) auf Kubernetes (dev/prod).

**Stack:** Spring Boot (Java 17), Node/Jest, Docker, Jenkins, Kubernetes (+Kustomize).

**Trennung:** dev vs. prod (Namespaces, Profile, Replikas, Approval-Gate).

## Architektur (vereinfacht)
```
[Dev/Prod Users] 
      │
   [Ingress]* 
      │
 ┌───────────────Cluster───────────────┐
 │  Service frontend → Pod frontend    │
 │  Service backend  → Pod backend     │
 └─────────────────────────────────────┘
           ▲                │
        Jenkins  ───►  Container Registry
           │  Build/Test/Push & Deploy
```
(*Ingress optional, Services intern*)

## Pipeline
1) Checkout  2) Build/Test  3) Docker Build & Push  4) Deploy Dev  5) Approval  6) Deploy Prod

**Ergebnis:** Wiederholbarer, versionssicherer Rollout, klare Trennung dev/prod, Health-Checks, Rollback-fähig.

## Projektüberblick
- Vollautomatischer CI/CD-Flow für Java/JS-App auf Kubernetes (dev/prod)
- Stack: Spring Boot (Java 17), Node/Jest, Docker, Jenkins, Kustomize
- Trennung: dev vs. prod (Namespaces, Profile, Replikas, Approval-Gate)

## CI/CD-Pipeline
1. Checkout
2. Build & Test (JUnit/Jest)
3. Docker Build & Push (Tag + latest)
4. Deploy Dev (auto)
5. Approval
6. Deploy Prod (exakter Tag)

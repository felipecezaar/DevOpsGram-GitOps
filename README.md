# DevOpsGram-GitOps

An example project developed in Python with Flask, designed to run on Kubernetes or OpenShift with GitOps (FluxCD) implementation, featuring basic user authentication and registration.

> 📄 English version of the documentation.

---

## 📋 Description

DevOpsGram-GitOps is a web application that demonstrates:

- User authentication (login/registration)
- GitOps workflow with FluxCD
- CI/CD with GitHub Actions
- Deployment on Kubernetes/OpenShift
- DevOps best practices

---

## ✨ Features

- **Authentication System**
  - Login with credentials
  - New user registration
- **GitOps Implementation**
  - Automated synchronization with FluxCD
  - Declarative infrastructure management
- **Automated Pipeline**
  - Build and test via GitHub Actions
- **Cloud Ready**
  - Configurations for Kubernetes and OpenShift

---

## 🛠️ Technologies

- Python 3.9+
- Flask
- Kubernetes/OpenShift
- FluxCD
- GitHub Actions
- Docker

---

## 🚀 Prerequisites

- Python 3.9+
- Docker
- Access to a Kubernetes/OpenShift cluster
- `kubectl` or `oc` CLI
- FluxCD CLI (for initial setup)

---

## ⚙️ Setup

### 1. Clone the repository

```bash
git clone https://github.com/felipecezaar/DevOpsGram-GitOps.git
cd DevOpsGram-GitOps
```

### 2. Create a virtual environment

```bash
python -m venv venv
source venv/bin/activate  # Linux/MacOS
# or
venv\Scripts\activate     # Windows
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

---

## 🏃 Local Run

```bash
flask run
```

Access: [http://localhost:5000](http://localhost:5000)

---

## 🔧 CI/CD Pipeline

GitHub Actions workflow (`.github/workflows/build-test.yml`) automates:

- Docker image build
- Test execution
- Image push to container registry

---

## 🐳 Docker Build

```bash
docker build -t devopsgram-gitops:latest .
```

---

## ☸️ GitOps Deployment with FluxCD

### Prerequisites

- Install FluxCD CLI:

```bash
curl -s https://fluxcd.io/install.sh | sudo bash
```

- Kubernetes cluster running

### Bootstrap FluxCD Example (one-time setup)

```bash
flux bootstrap github \
  --owner=felipecezaar \
  --repository=devopsgram-gitops \
  --branch=main \
  --path=clusters/devopsgram-gitops \
  --read-write-key=true \
  --personal \
  --components-extra=image-reflector-controller,image-automation-controller
```

### Directory Structure for FluxCD

```
clusters/devopsgram-gitops/
├── flux-system/                   # FluxCD Config
│   ├── gotk-components.yaml
│   ├── gotk-sync.yaml
│   └── kustomization.yaml
└── apps-devopsgram-gitops.yaml    # File Kustomization Config App
```

### Synchronization

FluxCD will automatically:

- Monitor the repository for changes
- Apply manifests in the `clusters` directory
- Perform health checks
- Automatically rollback on failures

### Monitoring FluxCD

```bash
flux get all
```

---

## 📂 Project Structure

```
DevOpsGram-GitOps/
├── .github/
│   ├── pull_request_template.md
│   └── workflows/
│       └── ci-workflow.yml
├── apps/base/
│   ├── deployment.yaml
│   ├── kustomization.yaml
│   ├── namespace.yaml
│   └── service.yaml
├── clusters/devopsgram-gitops/
│   ├── flux-system/
│   └── apps-devopsgram-gitops.yaml
├── templates/
│   ├── index.html
│   ├── login.html
│   └── signup.html
├── tests/
│   └── test_app.py
├── app.py
├── Dockerfile
├── README.md
└── requirements.txt
```

---

## 🧪 Tests

Run the tests with:

```bash
python -m pytest tests/
```

---

## 🤝 Contributing

1. Fork the project  
2. Create your branch: `git checkout -b feature/foo`  
3. Commit your changes: `git commit -am 'Add some foo'`  
4. Push to the branch: `git push origin feature/foo`  
5. Open a Pull Request

---

## 📄 License

MIT - See [LICENSE](LICENSE) for details.

---

## 📘 Versão em Português

> Em breve...

---

## 📘 Versione Italiana

> In arrivo...

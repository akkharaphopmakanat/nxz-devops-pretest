provider "kubernetes" {
  config_path = "~/.kube/config" 
}

resource "kubernetes_deployment" "nxz_app" {
  metadata {
    name = var.deployment_name 
    labels = {
      app = "nxz"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "nxz"
      }
    }

    template {
      metadata {
        labels = {
          app = "nxz"
        }
      }

      spec {
        container {
          name  = "nxz-container"
          image = "akkharaphopmakanat/nxz-devops-pretest:latest"
          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

# Kubernetes Service
resource "kubernetes_service" "nxz_app_service" {
  metadata {
    name = var.service_name
  }

  spec {
    selector = {
      app = "nxz"
    }

    port {
      port        = 3000
      target_port = 3000
    }

    type = "NodePort"
  }
}

terraform {
  required_providers {
    render = {
      source  = "render-oss/render"
      version = ">= 1.7.0"
    }
  }
}

provider "render" {
  api_key  = var.render_api_key
  owner_id = var.render_owner_id
}

variable "github_actor" {
  description = "GitHub username"
  type        = string
}

resource "render_web_service" "flask_app" {
  name   = "flask-render-iac-${var.github_actor}"
  plan   = "free"
  region = "frankfurt"

  runtime_source = {
    image = {
      image_url = var.image_url
      tag       = var.image_tag
    }
  }

env_vars = {
  ENV = {
    value = "production"
  }
}
# Flask Web Service
resource "render_web_service" "flask" {
  name   = "flask-app-TONNOM"
  region = "frankfurt"
  plan   = "free"

  runtime_source = {
    image = {
      image_url = "ghcr.io/TON_GITHUB_USERNAME/TON_REPO:latest"
    }
  }

  env_vars = {
    DATABASE_URL = {
      value = "postgresql://..." # Colle ton Internal Database URL ici
    }
    ENV = {
      value = "production"
    }
  }
}

# Adminer Web Service
resource "render_web_service" "adminer" {
  name   = "adminer-TONNOM"
  region = "frankfurt"
  plan   = "free"

  runtime_source = {
    image = {
      image_url = "adminer:latest"
    }
  }
}

}

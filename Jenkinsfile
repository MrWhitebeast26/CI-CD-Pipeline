pipeline {
  agent any

  environment {
    GOOGLE_CREDENTIALS = credentials('gcp-service-account-key') // Jenkins Secret Text
    PROJECT_ID = 'your-gcp-project-id'
    REGION     = 'us-central1'
    IMAGE_NAME = "gcr.io/${PROJECT_ID}/my-cloudrun-app:${env.BUILD_ID}"
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          sh "docker build -t ${IMAGE_NAME} ."
        }
      }
    }

    stage('Push Docker Image') {
      steps {
        script {
          sh "echo ${GOOGLE_CREDENTIALS} | docker login -u _json_key --password-stdin https://gcr.io"
          sh "docker push ${IMAGE_NAME}"
        }
      }
    }

    stage('Terraform Init & Apply') {
      steps {
        script {
          sh '''
          terraform init
          terraform apply -auto-approve -var="project_id=${PROJECT_ID}" -var="docker_image=${IMAGE_NAME}"
          '''
        }
      }
    }
  }

  post {
    always {
      cleanWs()
    }
  }
}
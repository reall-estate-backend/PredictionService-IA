pipeline {
    agent any
    environment {
        DOCKER_CREDENTIALS_ID = 'dockerhub-credentials' // Update with your Docker credentials ID
        IMAGE_NAME = 'realestate1234/python-microservice' // Replace with your Docker Hub repository
    }
    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt' // Install Python dependencies
            }
        }
        stage('Run Tests') {
            steps {
                sh 'pytest' // Run unit tests
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    def imageTag = "${IMAGE_NAME}:latest"
                    sh "docker build -t ${imageTag} ."
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        def imageTag = "${IMAGE_NAME}:latest"
                        sh "docker push ${imageTag}"
                    }
                }
            }
        }
    }
}

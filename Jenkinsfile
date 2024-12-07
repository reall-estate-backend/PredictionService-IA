pipeline {
    agent {
        docker {
            image 'python:3.9.20'
        }
    }
    environment {
        DOCKER_CREDENTIALS_ID = 'dockerhub-credentials'
        IMAGE_NAME = 'realestate1234/python-microservice'
    }
    stages {
        stage('Install Dependencies') {
            steps {
                //sh 'pip install --upgrade pip'
                sh 'pip install --no-cache-dir -r requirements.txt'
            }
        }
        stage('Run Tests') {
            steps {
                sh '''
                    . venv/bin/activate
                    pytest
                '''
            }
        }
        stage('Build Docker Image') {
            steps {
                sh '''
                    docker build -t ${IMAGE_NAME}:latest .
                '''
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        sh "docker push ${IMAGE_NAME}:latest"
                    }
                }
            }
        }
    }
}

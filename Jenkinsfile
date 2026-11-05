pipeline {

    agent any

    stages {

        stage('Clone') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/apoorvaramesh11/simple-java-app.git'
            }
        }

        stage('Build Application') {
            steps {
                sh 'java app.java'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t img-1 .'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'DOCKERHUB_ID',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    '''
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push img-1'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run --rm img-1'
            }
        }
    }
}

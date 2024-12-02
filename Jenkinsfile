pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t image1 .'
            }
        }
        stage('Run Docker Container') {
            steps {
                sh '''
                    docker stop cont1 || true
                    docker rm cont1 || true
                    docker run -d -p 9090:80 --name cont1 image1
                '''
            }
        }
    }
    post {
        always {
            echo 'Deployment Completed!'
        }
    }
}

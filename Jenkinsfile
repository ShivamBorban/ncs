pipeline {
    agent any
    stage('Build Docker Image') {
        steps {
            sh 'docker build -t image1 .'
        }
    }
    stage('Run Docker Container') {
        steps {
            sh 'docker run -d -p 9090:80 --name cont1 image1'
        }
    }
    post {
        always {
            echo 'Deployment Completed!'
        }
    }
}

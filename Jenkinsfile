pipeline {
    agent any

    stages {
        stage('Deploy to Nginx') {
            steps {
                script {
                    // Assuming the index.html is already present in the Jenkins workspace
                    // Copy the specific index.html file to Nginx server's web directory
                    sh 'sudo cp index.html /var/www/html/'

                    // Restart Nginx to apply changes
                    sh 'sudo systemctl restart nginx'
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment was successful!'
        }

        failure {
            echo 'Deployment failed!'
        }
    }
}

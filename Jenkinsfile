pipeline {
    agent any

    stages {
        stage('Copy Artifact') {
            steps {
                // Copiază war-ul din job-ul de build
                copyArtifacts filter: '**/*.war', projectName: 'Build code', selector: lastSuccessful()
            }
        }

        stage('Docker Build & Push') {
            steps {
                sh 'docker build -t myrepo/webapp:latest .'
                sh 'docker push myrepo/webapp:latest'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl rollout restart deployment webapp-deployment'
            }
        }
    }
}


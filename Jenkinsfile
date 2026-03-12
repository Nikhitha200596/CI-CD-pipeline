pipeline{
    agent any
    stages{
        stage('Build Docker Image'){
            steps{
                but 'docker build --no-cache -t vite-app .'
            }
        }
        stage('Deploy Container'){
            steps{
                but '''
                docker stop vite-container || echo Container not running
                docker rm vite-container || echo Container not found
                docker run -d -p 8081:80 --name vite-container vite-app
                '''
            }
        }
    }
}
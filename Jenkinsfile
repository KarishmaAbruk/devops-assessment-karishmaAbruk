pipeline {
    agent any

    environment {
       AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id') 
       AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }

    stages {
        stage('Init Terraform') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Apply') {
            steps {
                input message: 'Apply Instance creation?', ok: 'Apply'
                sh 'terraform apply tfplan'
            }
        }

        stage('Show Outputs') {
            steps {
                sh 'terraform output'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}

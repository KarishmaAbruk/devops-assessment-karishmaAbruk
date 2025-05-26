pipeline {
    agent any

    parameters {
        choice(name: 'TF_ACTION', choices: ['plan', 'apply', 'destroy'], description: 'Terraform action to perform')
    }

    environment {
        TF_VAR_aws_region         = 'us-east-1'
        TF_VAR_availability_zone = 'us-east-1a'
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }

        stage('Setup Terraform') {
            steps {
                sh 'terraform --version'
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            when {
                expression { params.TF_ACTION == 'plan' }
            }
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            when {
                expression { params.TF_ACTION == 'apply' }
            }
            steps {
                input message: 'Are you sure you want to apply?', ok: 'Apply'
                sh 'terraform apply -auto-approve'
            }
        }

        stage('Terraform Destroy') {
            when {
                expression { params.TF_ACTION == 'destroy' }
            }
            steps {
                input message: 'Are you sure you want to destroy?', ok: 'Destroy'
                sh 'terraform destroy -auto-approve'
            }
        }
    }

    post {
        always {
            echo "Terraform action '${params.TF_ACTION}' completed."
        }
    }
}

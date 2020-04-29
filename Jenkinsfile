/*
 * Standardized Jenkinsfile for Ansible Role CI
 */

pipeline {

    agent {
        docker {
            image 'quay.io/ansible/molecule:3.0.3'
            args '-u root:root -v /var/run/docker.sock:/var/run/docker.sock -v ${PWD}:/role'
        }
    }

    environment {
        VCENTER = credentials('ci-lab')
        VCENTER_HOST = credentials('ci-lab-vc')
    }

    stages {

        stage ('Display Debug Info') {
            steps {
                sh '''
                    echo "${VCENTER}"
                    docker -v
                    python3 -V
                    ansible --version
                    molecule --version
                '''
            }
        }

        stage ('Install Prerequisites') {
            steps {
                sh "pip install --upgrade pip"
                sh "pip install --upgrade setuptools"
                sh "pip install --upgrade ansible testinfra pyvmomi requests pyOpenSSL ansible-lint yamllint"
            }
        }

        stage ('Molecule Test') {
            steps {
                sh '''
                    pwd
                    molecule test --all
                '''
            }
        }

    }
}
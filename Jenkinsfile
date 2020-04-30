/*
 * Standardized Jenkinsfile for Ansible Role
 */

pipeline {

    agent {
        docker {
            image 'quay.io/ansible/molecule:3.0.4'
            args '--network host -u root:root -v /var/run/docker.sock:/var/run/docker.sock -v ${PWD}:/role'
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
                    ansible --version
                    molecule --version
                '''
            }
        }

        stage ('Install Prerequisites') {
            steps {
                sh "pip install --upgrade pip"
                sh "pip install --upgrade setuptools"
                sh "pip install pyvmomi==6.7.3"
            }
        }

        stage ('Molecule Test') {
            steps {
                sh "molecule test --all --destroy=never"
            }
        }

    }
}
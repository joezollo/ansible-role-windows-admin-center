/*
 * Standardized Jenkinsfile for Ansible Role CI
 */

pipeline {

    agent {
        docker {
            image 'quay.io/ansible/molecule'
            args '-u root:sudo -v /var/run/docker.sock:/var/run/docker.sock -v ${PWD}:/role'
        }
    }

    environment {
        VCENTER = credentials('ci-lab')
        VCENTER_HOST = credentials('ci-lab-vc')
    }

    stages {

        stage ('Display Versions') {
            steps {
                sh '''
                    echo "${VCENTER}"
                    docker -v
                    python -V
                    ansible --version
                    molecule --version
                '''
            }
        }

        stage ('Install Prerequisites') {
            steps {
                sh "sudo python3 -m pip install --upgrade testinfra pyvmomi requests pycurl pyOpenSSL ansible-lint yamllint"
            }
        }

        stage ('Molecule Test') {
            steps {
                sh '''
                    cd /role
                    sudo molecule test --all
                '''
            }
        }

    }
}
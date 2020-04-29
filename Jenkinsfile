/*
 * Standardized Jenkinsfile for Ansible Role CI
 */

pipeline {

    agent any

    environment {
        VCENTER = credentials('ci-lab')
        VCENTER_HOST = credentials('ci-lab-vc')
    }

    stages {
        stage ('Setup Virtual Environments') {
            steps {
                sh '''
                    pip3.6 install virtualenv
                    virtualenv ci-ansible-current
                    . ./ci-ansible-current/bin/activate
                    python3 -m pip install --upgrade pip
                    python3 -m pip install --upgrade ansible molecule docker
                    python3 -m pip install --upgrade testinfra pyvmomi pyvim requests pywinrm pycurl pyOpenSSL ansible-lint yamllint
                '''
            }
        }

        stage ('Diagnostic Information') {
            steps {
                sh '''
                    . ./ci-ansible-current/bin/activate
                    python -V
                    ansible --version
                '''
            }
        }

        stage ('Execute Molecule Tests') {
            steps {
                sh '''
                    . ./ci-ansible-current/bin/activate
                    molecule --debug test
                '''
            }
        }
  }

}
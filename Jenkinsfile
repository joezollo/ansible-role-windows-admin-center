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
        stage ('Setup Python Virtual Environment') {
            steps {
                sh '''
                    virtualenv ci-venv
                    . ./ci-venv/bin/activate
                    pip install --upgrade ansible ansible-lint yamllint molecule docker pyvmomi requests pywinrm pycurl pyOpenSSL
                '''
            }
        }

        stage ('Output Diagnostic Information') {
            steps {
                sh '''
                    . ./ci-venv/bin/activate
                    python -V
                    ansible --version
                    ansible-lint --version
                    molecule --version
                '''
            }
        }

        stage ('Execute Molecule Tests') {
            steps {
                sh '''
                    . ./ci-venv/bin/activate
                    molecule test --all
                '''
            }
        }
  }

}
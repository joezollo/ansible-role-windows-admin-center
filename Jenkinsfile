pipeline {

    agent {
        // Node setup : minimal centos7, plugged into Jenkins, and
        // git config --global http.sslVerify false
        // sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm
        // sudo yum -y install python36u python36u-pip python36u-devel git curl gcc
        // git config --global http.sslVerify false
        // sudo curl -fsSL get.docker.com | bash
        label 'Molecule_Slave'
    }

    stages {

        stage ('Get latest code') {
            steps {
                checkout scm
            }
        }

        stage ('Setup Python virtual environment') {
            steps {
                sh '''
                    export HTTP_PROXY=http://10.123.123.123:8080
                    export HTTPS_PROXY=http://10.123.123.123:8080
                    pip3.6 install virtualenv
                    virtualenv virtenv
                    source virtenv/bin/activate
                    pip install --upgrade ansible molecule docker
                '''
            }
        }

        stage ('Display versions') {
            steps {
                sh '''
                    source virtenv/bin/activate
                    docker -v
                    python -V
                    ansible --version
                    molecule --version
                '''
            }
        }

        stage ('Molecule test') {
            steps {
                sh '''
                    source virtenv/bin/activate
                    molecule test
                '''
            }
        }

    }

}
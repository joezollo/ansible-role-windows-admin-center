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
        ANSIBLE_HOST_KEY_CHECKING = "False"
    }

    stages {

        stage ('Pull Molecule Windows Config') {
            steps {

                checkout(
                    [
                        $class: 'GitSCM', 
                        branches: [[name: '*/master']],
                        doGenerateSubmoduleConfigurations: false,
                        extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'ansible-ci-win']],
                        submoduleCfg: [],
                        userRemoteConfigs: [[credentialsId: 'github-ssh-joezollo',
                            url: 'git@github.com:joezollo/ansible-ci-windows.git']
                        ]
                    ]
                )

            }
        }

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
                sh "apk add --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ sshpass"
                sh "pip install --upgrade pip"
                sh "pip install --upgrade setuptools"
                sh "pip install pyvmomi"
            }
        }

        stage ('Molecule Test') {
            steps {
                sh "ls -al"
                sh "ls -al ansible-ci-win/"
                sh "mv ansible-ci-win/create.yml molecule/"
                sh "mv ansible-ci-win/destroy.yml molecule/"
                sh "rm -rf ansible-ci-win/"
                sh "ls -al molecule"
                sh "molecule --debug test --all --destroy=never"
            }
        }

    }
}
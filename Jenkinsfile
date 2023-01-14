pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '20', daysToKeepStr: '5'))
    }

    stages {
        stage('checkout') {
            steps {
                script {
                    properties([pipelineTriggers([pollSCM('* * * * *')])])
                }
                git 'https://github.com/jachetblix/devops-experts-first.git'
            }
        }
        stage('Run rest_app') {
            steps {
                script {
                        sh 'nohup python3 devops-experts-first/rest_app.py &'
                    }
                }
            }
        }
        stage('Run web_app') {
            steps {
                script {

                        sh 'nohup python3 devops-experts-first/web_app.py &'
                }
            }
        }
        stage('Run backend_testing') {
            steps {
                script {
                        sh 'python3 devops-experts-first/backend_testing.py'
                }
            }
        }
        stage('Run frontend_testing') {
            steps {
                script {
                        sh 'python3 devops-experts-first/frontend_testing.py'
                }
            }
        }
        stage('Run combined_testing') {
            steps {
                script {
                        sh 'python3 devops-experts-first/combined_testing.py'
                }
            }
        }
        stage('Run clean_environment') {
            steps {
                script {
                        sh 'python3 devops-experts-first/clean_environment.py'
                }
            }
        }
    }
}


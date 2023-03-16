pipeline {
    agent none
    stages {
        stage('Build') {
            parallel {
                stage('Windows') {
                    agent { label 'windows' }
                    steps {
                        // Build steps for Windows worker
                    }
                }
                stage('Linux') {
                    agent { label 'linux' }
                    steps {
                        // Build steps for Linux worker
                    }
                }
            }
        }
    }
}

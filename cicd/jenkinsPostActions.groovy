// Archive artifacts: The Archive Artifacts post-build action allows you to archive the build artifacts so that they can be accessed later. 
// This is useful for storing build artifacts that may be needed for deployment or testing. 
//   You can archive any files or directories that are produced during the build process. Here's an example:

pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'make'
            }
        }
    }

    post {
        always {
            archiveArtifacts 'build/*.jar'
        }
    }
}


// Trigger other builds: The Build Other Projects post-build action allows you to trigger other builds based on the result of the current build. 
//   This is useful for building dependencies or triggering downstream jobs. Here's an example:
  
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'make'
            }
        }
    }

    post {
        success {
            build job: 'downstream-project', wait: false
        }
    }
}


// Send email notifications: The Email Notification post-build action allows you to send email notifications 
// to a list of recipients based on the result of the build. This is useful for alerting team members 
//   about build failures or successes. Here's an example:

pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'make'
            }
        }
    }

    post {
        failure {
            emailext body: 'The build failed, please investigate', subject: 'Build failed', to: 'team@example.com'
        }
        success {
            emailext body: 'The build succeeded, congratulations!', subject: 'Build succeeded', to: 'team@example.com'
        }
    }
}



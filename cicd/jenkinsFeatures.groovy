// Declarative syntax:

pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
    }
}

// This example uses the declarative syntax to define a pipeline with two stages, 
//   'Build' and 'Test'. The 'sh' step runs Maven commands to build and test the project.

// Pipeline stages:

pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'mvn deploy'
            }
        }
    }
}

// This example adds a new stage to the pipeline, 'Deploy', 
//   which runs the Maven 'deploy' command to deploy the project to a remote repository.

// Parallel execution:

pipeline {
    agent any
    stages {
        stage('Build and Test') {
            parallel {
                stage('Build') {
                    steps {
                        sh 'mvn clean install'
                    }
                }
                stage('Test') {
                    steps {
                        sh 'mvn test'
                    }
                }
            }
        }
    }
}

// This example uses parallel stages to run the build and test phases of the pipeline concurrently, which can save time.

// Input steps:

pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Deploy') {
            steps {
                input "Deploy to production?"
                sh 'mvn deploy'
            }
        }
    }
}

// This example uses an input step to prompt the user for input before proceeding with the deployment phase of the pipeline.

// Environment variables:

pipeline {
    agent any
    environment {
        BRANCH_NAME = "${env.GIT_BRANCH}"
    }
    stages {
        stage('Build') {
            steps {
                sh "mvn -B -Dmaven.test.failure.ignore=true clean install -P${BRANCH_NAME}"
            }
        }
    }
}

// This example sets an environment variable, 'BRANCH_NAME', to the current Git branch before running the build phase of the pipeline. 
//   The variable is then used in the Maven command to select a specific build profile based on the branch name.

// Timeouts:

pipeline {
    agent any
    options {
        timeout(time: 1, unit: 'HOURS')
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
    }
}

// This example sets a timeout of 1 hour for the entire pipeline using the 'timeout' option. 
//   This ensures that the pipeline does not run indefinitely if a build or test phase gets stuck.

// Conditions and loops:

pipeline {
    agent any
    stages {
        stage('Build') {
            when {
                branch 'master'
            }
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Test') {
            when {
                allOf {
                    branch 'feature/*'
                    not { environment name: 'SKIP_TESTS', value: 'true' }
                }
            }
            steps {
                sh 'mvn test'
            }
        }
    }
}

// This example uses conditional statements ('when') to control when stages are run based 
// on the Git branch name and the value of an environment variable. 
//   It also uses a loop ('allOf') to combine multiple conditions.

// Integrations:

pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t myapp .'
            }
        }
        stage('Deploy') {
            environment {
                AWS_REGION = 'us-east-1'
            }
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    sh 'ecs deploy myapp --region ${AWS_REGION}'
                }
            }
        }
    }
}
// This example integrates the pipeline with Amazon Web Services (AWS) by using the AWS credentials plugin 
// and the AWS CLI to deploy a Docker container to Amazon Elastic Container Service (ECS).

// Test reports and metrics:

pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/**/*.xml'
                }
            }
        }
    }
}

// This example generates JUnit test reports using the 'junit' step in the post section of the 'Test' stage. 
//   These reports can be used to track test results and failures over time.

// Post-build actions:

pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Deploy') {
            steps {
                sh 'mvn deploy'
            }
            post {
                always {
                    slackSend (color: '#36a64f', message: "Deployment to production succeeded.")
                }
                success {
                    mail to: 'team@example.com', subject: 'Deployment notification', body: 'Deployment to production succeeded.'
                }
            }
        }
    }
}

// This example sends notifications using the Slack and email plugins in the post section of the 'Deploy' stage. 
  The notifications are triggered based on the success or failure of the deployment phase.

// // Running Unit Tests: 
//   Unit tests are a critical component of any software development process, 
//     and it is essential to ensure that they are run as part of the build process. 
//     You can use the sh command to run unit tests from your Jenkins pipeline. For example:
stage('Run Unit Tests') {
    steps {
        sh './gradlew test'
    }
}

// Running Integration Tests: 
//   Integration tests verify the interactions between different components of your software. 
//   These tests are typically more complex and take longer to run than unit tests. 
//   You can use the sh command to run integration tests from your Jenkins pipeline. For example:

stage('Run Integration Tests') {
    steps {
        sh './gradlew integrationTest'
    }
}

// Running Code Quality Checks: 
//   Code quality checks are a critical component of any software development process. 
//   You can use tools like SonarQube or Checkstyle to perform code quality checks as part of your Jenkins pipeline. For example:

stage('Code Quality Check') {
    steps {
        withSonarQubeEnv('SonarQube') {
            sh './gradlew sonarqube'
        }
    }
}

// Running Security Scans:
//   Security scans help identify potential security vulnerabilities in your software. 
//   You can use tools like OWASP ZAP or SonarQube to perform security scans as part of your Jenkins pipeline. For example:

stage('Security Scan') {
    steps {
        withEnv(['JAVA_HOME=/path/to/java']) {
            sh 'zap.sh -daemon -config api.disablekey=true -port 8080'
            sh './gradlew securityScan'
            sh 'zap-cli --zap-url http://localhost:8080 -p 8080 -c alerts-summary'
            sh 'zap-cli --zap-url http://localhost:8080 -p 8080 -c alerts -o html -f alerts.html'
        }
    }
}

// Deploying to a Test Environment: 
//   Once your software has passed all the tests, you can deploy it to a test environment 
// to ensure that it works correctly in a real-world setting. 
//   You can use the sh command to deploy your software to a test environment as part of your Jenkins pipeline. For example:

stage('Deploy to Test Environment') {
    steps {
        sh 'ssh user@hostname "cd /path/to/deploy/directory && ./deploy.sh"'
    }
}


// Example of a smoke test to check if your application is running via HTTPS:


stage('Smoke Test') {
    steps {
        script {
            def url = "https://your-application-url.com"
            def response = sh(
                script: "curl -k --write-out %{http_code} --silent --output /dev/null ${url}",
                returnStatus: true
            )
            if (response == 200) {
                println "Application is running via HTTPS"
            } else {
                error "Application is not running via HTTPS. Response code: ${response}"
            }
        }
    }
}


// This example uses the curl command to make an HTTPS request to your application's URL. 
// The -k option tells curl to ignore SSL certificate errors. The --write-out %{http_code} 
// option tells curl to print the HTTP status code of the response. The --silent option tells
// curl not to print any other output, and the --output /dev/null option tells curl to discard the response body.

// The sh command is used to execute the curl command as a shell script and return 
// the HTTP status code as the return value. If the response status code is 200 (OK), 
// the pipeline prints a message indicating that the application is running via HTTPS. 
// If the response status code is anything else, the pipeline fails with an error message 
// indicating that the application is not running via HTTPS and including the HTTP status code of the response.




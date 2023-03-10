// This pipeline has one stage called "Build" which contains a script block. 
// The script block gets the current branch name and commit message using environment 
// variables provided by Jenkins and the git command. It then checks the branch name 
// using regular expressions to determine which script to run. 
// If the branch name contains "master" or "main", it runs <project root folder>/master.py. 
// If the branch name contains "dev" or "hotfix", it runs <project root folder>/tests.py. 
// Otherwise, it prints the branch name and commit message. 
// Note that you'll need to replace <project root folder> with the actual path to your project root folder.

// This pipeline should be configured as a multibranch pipeline in Jenkins, 
// which means that Jenkins will automatically detect and build all branches in your Git repository. 
// You'll also need to configure the Git repository and credentials in Jenkins so that it can access your code.

pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                script {
                    // Get the branch name and commit message
                    def branchName = env.BRANCH_NAME
                    def commitMessage = sh(script: 'git log -1 --pretty=%B', returnStdout: true).trim()
                    
                    // Check the branch name to determine which script to run
                    if (branchName ==~ /master|main/) {
                        sh "<project root folder>/master.py"
                    } else if (branchName ==~ /dev/ || branchName.contains('hotfix')) {
                        sh "<project root folder>/tests.py"
                    } else {
                        echo "Running on branch: ${branchName}"
                        echo "Commit message: ${commitMessage}"
                    }
                }
            }
        }
    }
}

// To copy an artifact from another project in Jenkins using Groovy, you can use the CopyArtifact plugin. 
// Here's an example code snippet:

pipeline {
    agent any
    
    stages {
        stage('Copy Artifact') {
            steps {
                script {
                    def latestBuild = build(job: 'source-project', propagate: false)
                    def artifactName = 'my-artifact.jar'
                    copyArtifacts(
                        projectName: 'source-project',
                        selector: specific(
                            buildNumber: latestBuild.number,
                            filter: artifactId(artifactName)
                        ),
                        flatten: true,
                        target: 'destination-folder'
                    )
                }
            }
        }
    }
}


// In this example, we have a pipeline that copies an artifact named my-artifact.jar from 
// the source-project job to a destination-folder. Here's what the code does:

// We define a latestBuild variable that holds the latest build of the source-project job.
// We specify the artifact name we want to copy using the artifactName variable.
// We use the copyArtifacts step to copy the artifact. We specify the projectName of the source job, 
//   and use the specific selector to select the specific build number and artifact we want to copy. 
//   We set flatten to true to copy only the artifact and not the directory structure, and specify the target folder to copy the artifact to.
// By using the CopyArtifact plugin and specifying the source job, build number, and artifact name, 
//   we can easily copy artifacts from one job to another in Jenkins using Groovy.
  
  

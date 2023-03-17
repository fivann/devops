### Jenkins Shared Libraries
is a feature that allows you to define and share pipeline code across multiple Jenkins pipelines or projects. Shared Libraries allow you to define reusable code in a centralized location, reducing duplication and making it easier to manage and maintain pipelines.

Here's an example of how to create and use a Jenkins Shared Library:

Create a Shared Library: To create a Shared Library, go to the Jenkins dashboard, click on "Manage Jenkins" and then "Configure System". Under "Global Pipeline Libraries", add a new library and give it a name and a version number. You can define your pipeline code in the "src" folder of the library.

Define the pipeline code: In the Shared Library, you can define pipeline code in a file named vars/<function-name>.groovy. This file can contain any number of functions that can be called from a Jenkins pipeline.

Here's an example of a function that can be defined in a Shared Library:
```
def sayHello(String name) {
    echo "Hello, ${name}!"
}
```
Use the Shared Library in a pipeline: To use the Shared Library in a pipeline, you need to load it using the @Library annotation at the top of your Jenkinsfile. Here's an example:
```
@Library('my-shared-library@1.0.0') _

pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                sayHello('Jenkins')
            }
        }
    }
}
```
In this example, we load the my-shared-library library with version 1.0.0. We then define a pipeline block that contains a stage block that calls the sayHello function from the Shared Library.

Shared Libraries allow you to define and share common code across multiple pipelines or projects, making it easier to maintain and reuse code. By creating a centralized library, you can ensure that all pipelines use the same code, reducing duplication and simplifying maintenance.

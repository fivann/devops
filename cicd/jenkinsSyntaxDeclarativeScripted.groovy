// what is declarative syntax? What other syntaxes exist? what's the difference? with examples
// Declarative syntax is a simplified syntax for defining Jenkins pipelines that is designed 
//   to be more concise and easier to read than traditional scripted syntax. In declarative syntax, 
//   you describe the overall structure of your pipeline using a declarative language, 
//   while leaving the details of how individual stages and steps are executed to Jenkins.

// Declarative syntax uses a YAML-based syntax to define the pipeline structure and stages, 
//     with each stage containing a series of steps that Jenkins executes in order. Here's an example of a simple pipeline using declarative syntax:

pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'npm install'
        sh 'npm run build'
      }
    }
    stage('Test') {
      steps {
        sh 'npm test'
      }
    }
    stage('Deploy') {
      steps {
        sh 'npm deploy'
      }
    }
  }
}

// In contrast, scripted syntax is more flexible and allows for greater control over pipeline execution. 
//   In scripted syntax, you write a script that defines the pipeline structure and includes the details 
//   of how individual stages and steps are executed. Here's an example of the same pipeline using scripted syntax:

node {
  stage('Build') {
    sh 'npm install'
    sh 'npm run build'
  }
  stage('Test') {
    sh 'npm test'
  }
  stage('Deploy') {
    sh 'npm deploy'
  }
}

// As you can see, the scripted syntax requires more code to achieve the same result, and it's less 
// structured than the declarative syntax. However, it also provides more flexibility, 
//   allowing you to use programming constructs like loops, conditionals, and functions to define your pipeline.

// Overall, the choice between declarative and scripted syntax depends on your specific needs and preferences. 
//   Declarative syntax is recommended for simple pipelines and for developers who are new to Jenkins, 
//     while scripted syntax is better suited for more complex pipelines and experienced Jenkins users
//       who require greater control over the pipeline execution.
      

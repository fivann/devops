There are a few different ways you can label a Jenkins build with the name of the Git branch that it was run from:

    Use the GIT_BRANCH environment variable: 
    When Jenkins runs a job, it automatically sets a number of environment variables that you can use in your build steps. 
    One of these is GIT_BRANCH, which contains the name of the Git branch that the job is running from. 
    You can use this variable to label the build by adding a build step that sets the build description or label to the value of GIT_BRANCH.

    Use the git command: You can use the git command to fetch the name of the current branch and use it to label the build. 
    To do this, you can add a build step that runs a shell script that uses the git rev-parse --abbrev-ref HEAD command 
    to fetch the name of the current branch. You can then use this value to set the build label or description.

    Use a Jenkins plugin: There are a number of Jenkins plugins that can help you label builds 
    with the name of the Git branch that they were run from. For example, the "Build Name Setter" 
    plugin allows you to set the build name to a custom value, including the name of the Git branch.

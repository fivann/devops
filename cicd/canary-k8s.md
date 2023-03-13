### Canary Deployments with Kubernetes and Jenkins

We'll be setting up a train-schedule application. 
However, some recent deployments introduced bugs that did not become visible 
until after the changes were in the hands of real users. 
To mitigate these kinds of issues, we'll implement a canary deployment as part of the larger deployment pipeline.

The application runs on Kubernetes cluster, and we'll use a Jenkins pipeline to perform CI and deployments. 
We will need to add logic to this existing pipeline in order to implement the canary deployment.

We will need to create a fork of the sample course code here: 
https://github.com/linuxacademy/cicd-pipeline-train-schedule-canary

#### Solution
Create a free GitHub account, or log in to your GitHub account.
Create a free DockerHub account, or log in to your account.
We will also need to log in to all three of our servers using ssh and the provided credentials:
```ssh cloud_user@<PUBLIC_IP>```

Set up the project and Jenkins
To do this, you will need to perform the following steps:
First, we need to go to this code repo: 
https://github.com/linuxacademy/cicd-pipeline-train-schedule-canary.

Click the Fork button on this page.
After creating your personal fork, select the Jenkinsfile.
Click the Edit button for our file, and change the user name willbla to your personal Docker Hub username.
Get Into our Jenkins Server
In your web browser, enter the public IP provided for our Jenkins server, followed by :8080.

Set up our Jenkins Credentials
Perform the following in our web browser:
Select Manage Jenkins > Manage Credentials from the menu.
From the single credential present, click on global, then Add Credentials.
Enter your personal GitHub user name in the Username section.
Go to our GitHub browser and select your account, then from the dropdown, choose Settings.
Next, choose Developer settings followed by Personal access tokens.
Select Generate new token and do the following:
Set the Token description of jenkins.
Select the checkbox for admin:repo_hook.
Click Generate token.
Copy the token, and back in Jenkins, paste the token into the Password field.
Set the ID to github_key and the Description to GitHub Key.
Click OK.

Add Docker Hub Credentials
Click Add Credentials.
Provide your Docker Hub username and password in the corresponding fields.
Set the ID to docker_hub_login and the Description to Docker Hub.
Click OK.
Add Kubernetes Credentials

Click Add Credentials.
Set the Kind to Kubernetes configuration (kubeconfig)
Set the ID to kubeconfig and the description to Kubeconfig.
Click into our Kubernetes command line.
Run the following:
cat ~/.kube/config
Copy the contents of the file that appears.
Back in our Jenkins browser, paste what was copied into the Enter directly > Content section.
Click OK.
Set Up the project

To set up the project, follow these steps:

Go back to the main page by selecting the Jenkins icon at the top left of the website.
Click New Item.
Give the item the name train-schedule.
Select Multibranch Pipeline and click OK.
Under Branch Sources, change the Add source to GitHub.
Set up the page as follows:
Credentials: Option that ends in (GitHub Key)
Repository HTTPS URL: https://github.com/Your_GitHub_Username/cicd-pipeline-train-schedule-canary, then click Validate.
Select Save.
Review the Builds

Complete the following to review what we've done up to this point:

Should an item called Build Queue appear above your Build Executor Status, select the cancel button for it (the red box with an X in it).
Click on our Master build and wait for it to process.
Once the master build gets to the DeployToProduction stage, hover over the DeployToProduction, and select Proceed.
Click on our Kubernetes server, and enter the following to review our deployment:
kubectl get pods -w
To review our application, from our lab's credentials page, copy the Kubernetes' Public IP 
and paste it into a new browser window followed by :8080.

Add a Canary Stage to the Pipeline
To complete this, you will need to do the following:

Go back to GitHub and go to the fork that we made.
Copy the train-schedule-kube-canary.yml code.
Click Add file > Create new file.
Name the file train-schedule-kube-canary.yml.
Paste in the train-schedule-kube-canary.yml code.
Click Commit new file.
Select the Jenkinsfile, which can be found here.
Add a new stage after the Push Docker Image stage and before DeployToProduction:
```
}
stage('CanaryDeploy') {
  when {
    branch 'master'
  }
  environment {
    CANARY_REPLICAS = 1
  }
  steps {
    kubernetesDeploy(
      kubeconfigId: 'kubeconfig',
      configs: 'train-schdeule-kube-canary.yml',
      enableConfigSubstitution: true
      )
  }
}
```
Modify the DeployToProduction section but adding the following between the when { and steps { section:
```
}
environment {
  CANARY_REPLICAS = 0
}
```

Select Commit changes
Run a Successful Deployment

Run our set up to make sure everything is running correctly:

Go to our Kubernetes server and review the following:
```kubectl get pods -w```
Back on Jenkins, click Build Now to build our updated information.

Back on our Kubernetes node, we see our new pod information appears with our canary section.

Check on our website that everything is working by putting in the Public IP address for our Kubernetes with port :8081 at the end.

Once we know the site is working, go back to Jenkins, hover over DeployToProduction, and click Proceed.

On our Kubernetes server, we see the new node running.

Enter Ctrl + C to exit the node.

Run kubectl get pods and note that everything is running.


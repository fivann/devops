### To install Jenkins on an EC2 instance and run it behind Nginx, you can follow the steps below:

#### Launch an EC2 instance:

Choose an Amazon Machine Image (AMI) that supports Jenkins. The Amazon Linux 2 AMI is a good option.
Choose an instance type that meets your requirements. For example, t2.micro is a good option for testing.
Configure security groups to allow incoming traffic on ports 80 and 8080.

#### Install Jenkins:

Connect to your EC2 instance using SSH.

#### Install Jenkins by running the following commands:

```
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
sudo yum install jenkins
```

#### Configure Jenkins:

Start the Jenkins service by running the following command:

```
sudo systemctl start jenkins
```

Configure Jenkins by accessing it on port 8080 from your web browser. 
Follow the on-screen instructions to complete the setup.

#### Install and configure Nginx:

Install Nginx by running the following command:

```
sudo yum install nginx
```

Configure Nginx by editing the /etc/nginx/nginx.conf file. Add the following configuration:

```
server {
    listen 80;
    server_name your_domain.com;

    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

Restart the Nginx service by running the following command:
```
sudo systemctl restart nginx
```
Access Jenkins through Nginx:

Access Jenkins through Nginx by entering the URL http://your_domain.com in your web browser.
That's it! You have successfully installed Jenkins on an EC2 instance and configured it to run behind Nginx.

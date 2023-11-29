# POC


To run the automation, please refer the below steps:

1- Create an AWS account
2- Create an IAM User (that can perform task)
3- Perfom aws configure on your machine with the IAM user secret credentials
4- Install terraform on your machine and set it in the path or you can alternatively copy the terraform.exe in the root folder
5- main.tf is present in the repository which will create the ec2 instance on your aws cloud provider 
6- keypair.tf and securitygroup.tf are used to create keypair and securitygroup respectively 
7- Run the below commands from the root folder: 
      .\terraform init 
      .\terraform plan 
      .\terraform apply -auto-approve

8- The above commands will automatically configure the mediawiki installation 
9- show outputs (instance_ip and mediawiki urls), which can be used to access the web application
10- Use the URL mentioned in the terminal at the last to access the web application

# AutoScaling

1- Going ahead if we want to perform auto scaling, we can use kubernetes cluster, for that we have to setup the kubernetes cluster using the k8cluster.yml present inside /ansible/ folder. There are further other steps that will be included to autoscale the application such as worker node setup, etc
2- ansible-playbook.yml which is currently being used to install and setup mediawiki on ec2 instance will now be used inside Dockerfile to creata pods using images
3- Lateron, these pods can be handled using kubernetes cluster which will in turn handle the autoscaling of the application


Note: kubernetes cluster creation will not be possible in the current ec2 istance as the ami-id used for this doesn't meet the requirements (vcpu and ram) to create a k8 cluster. We have to update the ami id accordingly so that a higher compute ec2 instance can be provisioned

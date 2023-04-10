#1 create a repository to store the docker image in docker hub

#2 launch an ec2 instance via aws management console. name it docker-server
#3 while launching the ec2 instance, create security group and open port 80 and port 22

#4 ssh into the ec2 instance. to do that: first, put the ec2 key pair in the home directory of local machine. then, for mac ssh using:
#4 ssh -i <ec2_keypair name>  ec2-user@<public ipv4 of ec2 instance> e.g.,
#4 ssh -i dockerr-server.pem ec2-user@3.83.148.225

#5 after you have ssh'ed into your ec2. start running the following commands

# install and configure docker on the ec2 instance
sudo yum update -y

sudo yum install docker -y <or>
sudo amazon-linux-extras install docker -y

sudo service docker start
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
docker info

# create a dockerfile using vi editor
sudo vi Dockerfile 

# then press i for insert  >>> paste Dockerfile content >>> press esc button >>> type :wq! >>> press enter

# use path method to build the docker image 
docker build -t nn2 .

# login to your docker hub account
docker login --username niyiajiteru 

# put in the dockerhub password for username niyiajiteru

# use the docker tag command to give the image a new name
docker tag nn2 niyiajiteru/nn2

# push the image to your docker hub repository
docker push niyiajiteru/nn2

# start the container to test the image 
docker run -dp 80:80 niyiajiteru/nn2

#the image is now running & to confirm. copy the public ipv4 address of the docker-server & paste it in your browser.
#boom! website is live

# references
# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/create-container-image.html
# https://docs.docker.com/get-started/02_our_app/
# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/create-container-image.html#create-container-image-install-docker

# Inception

This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.
# Docker

Docker is an open source platform that enables developers to build, deploy, run, update and manage containers—standardized, executable components that combine application source code with the operating system (OS) libraries and dependencies required to run that code in any environment
# Docker containers

A Docker container is the same idea as a physical container—think of it like a box with an application in it. Inside the box, the application seems to have a computer all to itself: it has its own machine name and IP address, and it also has its own disk drive.

<img width="478" alt="Screen Shot 2022-12-13 at 3 38 05 PM" src="https://user-images.githubusercontent.com/69278312/207362543-fdf63f7e-802d-412f-83d0-0f6a5458db22.png">

The application inside the box can’t see anything outside the box, but the box is running on a computer, and that computer can also be running lots of other boxes. The applications in those boxes have their own separate environments (managed by Docker), but they all share the CPU and memory of the computer, and they all share the computer’s operating system.

<img width="679" alt="Screen Shot 2022-12-13 at 3 43 57 PM" src="https://user-images.githubusercontent.com/69278312/207364123-b99d40b7-cb86-4040-b064-5d7b116bdeb5.png">

# Docker images

Docker images contain executable application source code as well as all the tools, libraries, and dependencies that the application code needs to run as a container. When you run the Docker image, it becomes one instance (or multiple instances) of the container. 

# DockerFile

Every Docker container starts with a simple text file containing instructions for how to build the Docker container image. DockerFile automates the process of Docker image creation. It’s essentially a list of command-line interface (CLI) instructions that Docker Engine will run in order to assemble the image. The list of Docker commands is huge, but standardized: Docker operations work the same regardless of contents, infrastructure, or other environment variables.

# How to install docker in debain?

Once you have confirmed that you have one of these versions of Debian installed, you can follow these steps to install Docker:

1 - Update your system's package list by running the following command:

        sudo apt-get update
 
2 - Install the necessary dependencies for Docker by running the following command:
        
        sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common

3 - Add the Docker GPG key to your system by running the following command:

        curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
        
4 - Add the Docker repository to your system's list of sources by running the following command:

        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
        
5 - Update your system's package list again to include the Docker packages by running the following command:

        sudo apt-get update
        
6 - Install Docker by running the following command:
        
        sudo apt-get install docker-ce
        
7 - Start the Docker service by running the following command:

        sudo systemctl start docker
        
8 - Verify that Docker is running by running the following command:
        
        sudo docker run hello-world
->. If the installation was successful, You can now use Docker to run containers on your system  and thanks me ohhhh "Hi there 👋 i am error from 1337 you know this"

9 - To update Docker on Debian, you will need to first ensure that you have the latest version of the Docker package repository installed on your system. This can be done by running the following command:

        sudo apt-get update

10 - Once the package repository is up to date, you can then upgrade Docker by running the following command:

        sudo apt-get upgrade docker-ce

11 - This will install the latest version of Docker that is available in the package repository. If you want to be more specific about the version of Docker that you want to install, you can specify the version number using the -V option, like this:

        sudo apt-get install docker-ce=<version>

->. where <version> is the version number of the Docker package that you want to install.

It's also a good idea to run the docker system prune command after upgrading Docker to remove any old or unused data from the system. This can help to free up disk space and improve the performance of Docker.

# Docker and running Hello World
        
1 - Running Hello World in a container :
   You’re going to send a command to Docker, telling it to run a container that prints out some simple “Hello, World” text.
        
          docker container run diamol/ch02-hello-diamol
   The docker container run command tells Docker to run an application in a container. This application has already been
     <img width="636" alt="Screen Shot 2022-12-13 at 1 42 13 PM" src="https://user-images.githubusercontent.com/69278312/207321049-128841e9-c588-4331-a8de-8d732fdbc8ae.png">

        
packaged to run in Docker and has been published on a public site that anyone can access. The container package (which Docker calls an “image”) is named diamol/ ch02-hello-diamol. The command you’ve just entered tells Docker to run a container from that image.
        
 -> What happens if you run another container using the same command?

   You’ll see similar output to the first run, but there will be differences. Docker already has a copy of the image locally so it doesn’t need to download the image first; it gets straight to running the container. The container output shows the same operating sys- tem details, because you’re using the same computer, but the computer name and the IP address of the container will be different:
  
2 - Connecting to a container like a remote computer:
        
  if you were connecting to a remote machine. You use the same docker container run command, but you pass some additional flags to run an interactive container with a connected terminal session
         
           docker container run --interactive --tty diamol/base
  The --interactive flag tells Docker you want to set up a connection to the container, and the --tty flag means you want to connect to a terminal session inside the con- tainer
    
<img width="744" alt="Screen Shot 2022-12-13 at 4 01 44 PM" src="https://user-images.githubusercontent.com/69278312/207368494-a07bb609-786c-434c-8f09-013c241051ef.png">

 ->. Run the commands hostname and date and you’ll see details of the container’s environment:
        
           $ hostname
             f1695de1f2ec
           $ date
              Tue Dec 13 16:11:03 +01 2022
->. You can get details of all the running containers with this command:
                    
        docker container ls
->. docker container top lists the processes running in the con- tainer. I’m using f1 as a short form of the container ID f1695de1f2ec:

          $ docker container top f1
          PID                 USER                TIME                COMMAND
          69622               root                0:00                /bin/sh
->. docker container logs displays any log entries the container has collected:
        
           $ docker container logs f1
           / # hostname
           f1695de1f2ec
        
->. docker container inspect shows you all the details of a container:
        
            docker container inspect f1
        
 3 - Hosting a website in a container:
        
  ->. which shows all containers in any status:
        
        docker container ls --all
 That’s actually the main use case for Docker: running server applications like websites, batch processes, and databases.
   
 ->. That’s actually the main use case for Docker: running server applications like websites, batch processes, and databases
        
        docker container run --detach --publish 8088:80 diamol/ch02-hello-diamol-web
        
 ->. Run docker container ls and you’ll see that the new container has the status Up:
        
         docker container ls
    --detach—Starts the container in the background and shows the container ID 
    --publish—Publishes a port from the container to the computer 
        
  <img width="771" alt="Screen Shot 2022-12-13 at 4 28 29 PM" src="https://user-images.githubusercontent.com/69278312/207374830-b0a63ffc-03dc-468a-b5ba-caa639fbe8d6.png">
->. Browse to http://localhost:8088 on a browser. That’s an HTTP request to the local computer, but the response (see figure 2.7) comes from the container. 
 <img width="519" alt="Screen Shot 2022-12-13 at 4 29 32 PM" src="https://user-images.githubusercontent.com/69278312/207375047-43647670-af16-4b11-aaa9-02d46ddca46f.png">

->. docker container stats is another useful one: it shows a live view of how much CPU, memory, network, and disk the container is using. The output is slightly different for Linux and Windows containers:
        
        docker container stats e53
   When you’re done working with a container, you can remove it with docker container rm and the container ID, using the --force flag to force removal if the container is still running.
                
        docker container rm --force $(docker container ls --all --quiet)
 
4 - how Docker runs containers   
        
        <img width="532" alt="Screen Shot 2022-12-13 at 4 54 59 PM" src="https://user-images.githubusercontent.com/69278312/207381504-91619e31-1a87-4e25-b58a-b016d9a29df9.png">
 
The Docker Engine is the management component of Docker. It looks after the local image cache, downloading images when you need them, and reusing
 
# Building your own Docker images
  
 1 - Using a container image from Docker Hub
Pull the container image for the web-ping application:
                
        docker image pull diamol/ch03-web-ping
        
 <img width="816" alt="Screen Shot 2022-12-13 at 5 47 38 PM" src="https://user-images.githubusercontent.com/69278312/207393730-24a80b58-2651-4376-9937-1a59b5e8a668.png">
->. Let’s run a container from the image and see what the app does:
        
        docker container run -d --name web-ping diamol/ch03-web-ping
 
 The -d flag is a short form of --detach, so this container will run in the background.
 There’s one new flag in this command, which is --name. You know that you can work with containers using the ID that Docker generates, but you can also give them a friendly name. This container is called web-ping, and you can use that name to refer to the container instead of using the random ID.

->. Have a look at the logs from the application, which are being collected by Docker:
            
        docker container logs web-ping
<img width="976" alt="Screen Shot 2022-12-13 at 5 52 24 PM" src="https://user-images.githubusercontent.com/69278312/207394887-a1230378-cdad-454a-8421-a6697688df23.png">

 ->. Remove the existing container, and run a new one with a value specified for the TARGET environment variable:
       
          docker rm -f web-ping
          docker container run --env TARGET=google.com diamol/ch03-web-ping
  <img width="793" alt="Screen Shot 2022-12-13 at 5 55 36 PM" src="https://user-images.githubusercontent.com/69278312/207395524-2847b75f-d2b7-417a-a573-849c8453d308.png">

<img width="922" alt="Screen Shot 2022-12-13 at 6 28 54 PM" src="https://user-images.githubusercontent.com/69278312/207402930-f6a30a38-79a7-455a-acce-d0ab9f035c54.png">

2 - Writing Dockerfile
 The Dockerfile is a simple script you write to package up an application—it’s a set of instructions, and a Docker image is the output
   
                FROM diamol/node
                ENV TARGET="blog.sixeyed.com"
                ENV METHOD="HEAD"
                ENV INTERVAL="3000"
                WORKDIR /web-ping
                COPY app.js .
               CMD ["node", "/web-ping/app.js"]
        
 The Dockerfile instructions are FROM, ENV, WORKDIR,COPY, and CMD; they’re in capitals, but that’s a convention, not a requirement. Here’s
the breakdown for each instruction:
 
->. FROM—Every image has to start from another image. In this case, the web-ping image will use the diamol/node image as its starting point. That image has Node.js installed, which is everything the web-ping application needs to run.

->. ENV—Sets values for environment variables. The syntax is [key]="[value]", and there are three ENV instructions here, setting up three different environ- ment variables.

->. WORKDIR—Creates a directory in the container image filesystem, and sets that to be the current working directory. The forward-slash syntax works for Linux and Windows containers, so this will create /web-ping on Linux and C:\web-ping on Windows.

->. COPY—Copies files or directories from the local filesystem into the container image. The syntax is [source path] [target path]—in this case, I’m copying app.js from my local machine into the working directory in the image.

->. CMD—Specifies the command to run when Docker starts a container from the image. This runs Node.js, starting the application code in app.js.

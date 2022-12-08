# Inception

This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.
# Docker

Docker is an open source platform that enables developers to build, deploy, run, update and manage containers—standardized, executable components that combine application source code with the operating system (OS) libraries and dependencies required to run that code in any environment
# Docker containers

Docker containers are the live, running instances of Docker images. While Docker images are read-only files, containers are life, ephemeral, executable content. Users can interact with them, and administrators can adjust their settings and conditions using Docker commands
# Docker images

Docker images contain executable application source code as well as all the tools, libraries, and dependencies that the application code needs to run as a container. When you run the Docker image, it becomes one instance (or multiple instances) of the container. 

# DockerFile

Every Docker container starts with a simple text file containing instructions for how to build the Docker container image. DockerFile automates the process of Docker image creation. It’s essentially a list of command-line interface (CLI) instructions that Docker Engine will run in order to assemble the image. The list of Docker commands is huge, but standardized: Docker operations work the same regardless of contents, infrastructure, or other environment variables.

# How to install docker in debain?

Once you have confirmed that you have one of these versions of Debian installed, you can follow these steps to install Docker:

1 - Update your system's package list by running the following command:

        $sudo apt-get update
 
2 - Install the necessary dependencies for Docker by running the following command:
        
        $sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common

3 - Add the Docker GPG key to your system by running the following command:

        $curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
        
4 - Add the Docker repository to your system's list of sources by running the following command:

        $sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
        
5 - Update your system's package list again to include the Docker packages by running the following command:

        $sudo apt-get update
6 - Install Docker by running the following command:
        
        $sudo apt-get install docker-ce
        
7 - Start the Docker service by running the following command:

        $sudo systemctl start docker
        
8 - Verify that Docker is running by running the following command:
        
        $sudo docker run hello-world
If the installation was successful, You can now use Docker to run containers on your system ohhhh

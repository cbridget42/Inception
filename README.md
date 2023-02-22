# Inception
This project is a System Administration related exercise.

### Summary:
You will virtualize several Docker images, creating them  
in your new personal virtual machine.

### Requirements:
* A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
* A Docker container that contains WordPress + php-fpm (it must be installed and  
  configured) only without nginx.
* A Docker container that contains MariaDB only without nginx.
* A volume that contains your WordPress database.
* A second volume that contains your WordPress website files.
* A docker-network that establishes the connection between your containers.

You can see the full assignment here [subject](https://github.com/cbridget42/Inception/blob/main/subj/en.subject.pdf)

### Bonus part:
* Set up redis cache for your WordPress website in order to properly manage the  
  cache.
* Create a simple static website in the language of your choice except PHP (Yes, PHP  
  is excluded!). For example, a showcase site or a site for presenting your resume.
* Set up Adminer.

### Usage:
* build and run containers:
```bash
make
```
* stop containers:
```bash
make down
```
* purge docker:
```bash
make clean
```
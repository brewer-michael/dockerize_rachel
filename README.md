# dockerize_rachel
Revamping the RachelPi project to allow for deployment to a swarm of raspberry Pis or to support other hardware

## General Description
The need for an internet hub for extremely rural communities in impoverished locations is great, and great flexibility is required to meet their educational needs. This project looks to update the RachelPi project to utilize Docker to add flexibility and scalability to this solution.

## Project Core
https://github.com/worldpossible/rachelpiOS builds the environment for the webserver, website, and database framework RachelPi uses

https://github.com/worldpossible/contentshell creates the frontend

## Docker Files
Using the existing php7-apache and mysql-8.0 containers to set up the environment

## Goal
Update rachelpiOS/installer.py and Dockerfile where applicable to provision the environment and set up the server as well as network connectivity
Update contentshell to use the backend from our mysql container

Once basic functionality is operational build out features to take advantage of Docker Swarm
Utilize buildx to make Docker image flexible for ARM, AMD64, etc.

## Instructions
Run `docker-compose up --build`
Upon successful build web interface will be at http://localhost:8000

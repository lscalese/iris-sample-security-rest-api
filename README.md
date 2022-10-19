[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat&logo=AdGuard)](LICENSE)

# IRIS-Sample-Security-REST-Api

This is an example to expose IRIS security package with a REST API.  

## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.  

## Installation 

Clone/git pull the repo into any local directory

```
git clone https://github.com/lscalese/iris-sample-security-rest-api.git
```

Open the terminal in this directory and call the command to build and run InterSystems IRIS in container:

```
docker-compose up -d
```

## Open swagger interface

Open the following url in your browser [http://localhost:32773/swagger-ui/index.html](http://localhost:32773/swagger-ui/index.html)  
and explore [http://localhost:32773/config-api/security/](http://localhost:32773/config-api/security/) to open the specification.  
Use _system\SYS to login.  


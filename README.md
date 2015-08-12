# Docker image for the OpeNER project

## What is OpeNER ?

From the [OpeNER project website](http://www.opener-project.eu/): 
> OpeNER is a language analysis toolchain helping (academic) researchers and companies make sense out of "natural language analysis"

## Why a docker image ?

OpeNER needs an execution environment with a lot of requirements: 
* A mac / linux / unix kind of operating system
* JRuby 1.7.9+
* Python 2.6+
* Java 1.7+
* Perl 5+
* libarchive development headers

Thanks to Docker, it's very easy to create such an environment, without side effects on your operating system!

## How to get the docker image ?

You can clone this repo and build the image yourself: 

`docker build -t opener .`

Or directly get it from [Docker Hub](https://hub.docker.com/r/sebprunier/opener/)

## How to run OpeNER ?

For example, you can start the `language-identifier-server` this way : 

`docker run -it -p 9292:9292 opener language-identifier-server`

and then access the service page at http://localhost:9292

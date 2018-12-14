# Docker-locust

This repository contains Dockerfile of locust for Docker's automated build.

## What is locust ?

Locust is an easy-to-use, distributed, user load testing tool. It is intended for load-testing web sites (or other systems) and figuring out how many concurrent users a system can handle.


The idea is that during a test, a swarm of locusts will attack your website. The behavior of each locust (or test user if you will) is defined by you and the swarming process is monitored from a web UI in real-time. This will help you battle test and identify bottlenecks in your code before letting real users in.

Locust is completely event-based, and therefore it’s possible to support thousands of concurrent users on a single machine. In contrast to many other event-based apps it doesn’t use callbacks. Instead it uses light-weight processes, through gevent. Each locust swarming your site is actually running inside its own process (or greenlet, to be correct). This allows you to write very expressive scenarios in Python without complicating your code with callbacks.

## Information

* Based on [python:3.6-alpine](https://hub.docker.com/_/python/)
* Install [Docker](https://www.docker.com/)
* Install [Docker Compose](https://docs.docker.com/compose/install/)
* Following the locust release from [Python Package Index](https://pypi.org/project/locustio/)

## Standalone mode

```
docker run --rm --name standalone --hostname standalone -e ATTACKED_HOST=http://standalone:8089 -v /path/to/locust/script/folder:/locust -p 8089:8089 -d medmrgh/docker-locust:latest
```

## Distributed mode

```
docker-compose up
```

## Scale the number of slaves

```
docker-compose scale slave=5
```

## UI Links

* [localhost:8089](http://localhost:8089)

## Contribution

Easy boy ! Fork, improve and PR  :innocent:

## Author

[Mohammed MARRAGH](http://www.marraghmohammed.com)

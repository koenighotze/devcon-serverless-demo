# Demo for Serverless@Devcon

[![License: CC BY-NC 4.0](https://licensebuttons.net/l/by-nc/4.0/80x15.png)](https://creativecommons.org/licenses/by-nc/4.0/)

This repository contains the demos for the Serverless@Devcon presentation.

Other relevant demos are related to the Alexa, S3-React and Polly conference schedule:

- [the alexa skill and api lambda](https://github.com/koenighotze/alexa-devcon-schedule)
- [the react/s3 hosted frontend](https://github.com/koenighotze/devcon-schedule-ui), see [here](http://dschmitz.devcon.ui.s3-website-eu-west-1.amazonaws.com/)
- [the schedule to speech lamdba](https://github.com/koenighotze/devcon-schedule-to-speech)

## [Demo 1](demo1_hellodevcon)

Simple 'Hello world' lambda. No frameworks no nothing.

```
$ npm run create.lambda && npm run invoke.lambda
```

## [Demo 2](demo1_sam_local)

Introduces SAM local for the 'Hello world' lambda.
Requires a local installation of [SAM local](https://github.com/awslabs/aws-sam-local).


Excecute the following command to test the lambda using SAM.

```
$ npm run test.lambda
```

## [Demo 3](demo1_hellodevcon_api)

Extends the lambda with a REST proxy API gateway, without any frameworks.

First of all create the API gateway:

```
$ create_api.sh
```

Then create the lambda and test the gateway:

```
$ npm run create.lambda && npm run test.lambda.api
```

## [Demo 4](demo1_hellodevcon_claudiajs)

Shows how easy an API gateway can be created using Claudia.JS.

Create the gateway using:

```
$ npm run claudia.create
```

Test it with

```
$ npm test
```

## General hints

This section offers some general tool tips and hints for dealing with aws lambda.

### Add X-Ray

Amazon X-Ray can be added to lambdas easily.

TODO:

### Fetching logs

(awslogs)[https://github.com/jorgebastida/awslogs] is a very useful convinience tool for retrieving CloudWatch logs.

```
$ awslogs get /aws/lambda/DevconScheduleApi
```

fetches the log stream of the lambda function `DevconScheduleApi`.



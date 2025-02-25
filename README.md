# Greeting Hex Javascript Node

This project contains a RESTful API for managing greetings in various languages.

## Prerequisites

- Node.js (v14 or later)
- Docker
- Docker Compose

## Setup

1. Clone the repository

```bash
git clone git@github.com:adambonsu/GreetingHexJavascriptNode.git
cd GreetingHexJavascriptNode

```

2. Install dependencies
   `npm install`

3. Create a `.env` file in the project root and add necessary environment variables:

```
PORT=3000
JWT_SECRET=YOUR_JWT_SECRET
```

Load the environment variables into your shell
`set -a; source .env; set +a`

## Build

To build the docker image:

```bash
docker build \
  -f ./docker/Dockerfile \
  -t greeting-hex-javascript-node:$(git rev-parse HEAD) \
  ./

```

## Run

Clear any open instances and images with `rm -vf $(docker ps -aq); docker rmi -f $(docker images -aq)`

### Using Docker Compose

1. Start the application:
   Using docker

```bash
docker run -p 3000:3000 greeting-hex-javascript-node:$(git rev-parse HEAD)

```

Or using docker-compose

```bash
docker-compose -f ./docker/docker-compose.yml up --build

```

2. The API will be available at `http://localhost:3000`
3. Access the OpenAPI documentation at `http://localhost:3000/api-docs`

## ECR

Registry URI: `757721680185.dkr.ecr.eu-west-2.amazonaws.com/greeting-hex-javascript-node`

1. Tag the image

```bash
docker tag greeting-hex-javascript-node:$(git rev-parse HEAD) 757721680185.dkr.ecr.eu-west-2.amazonaws.com/greeting-hex-javascript-node:$(git rev-parse HEAD)
```

2. Push tagged image to ECR
   Configure cli to connect to ECR

```bash
aws ecr get-login --no-include-email --region eu-west-2
docker push 757721680185.dkr.ecr.eu-west-2.amazonaws.com/greeting-hex-javascript-node:$(git rev-parse HEAD)
```

NB: If you encounter a `no basic auth credentials` error run this `eval $( aws ecr get-login --no-include-email --region eu-west-2 )` before attempting to push again

NB: If you encounter a `denied: Your authorization token has expired. Reauthenticate and try again.` error, run this `aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 757721680185.dkr.ecr.eu-west-2.amazonaws.com` before attempting to push again

### Download image from registry

```bash
aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin ${ECR_REGISTRY}

```

## ECS

### Set up environment

Update the `container_image` in [the dev environment](./terraform/environments/dev/main.tf) to match the image pushed to the ECR
Via the terminal launch the environment in the cloud:

```bash
cd terraform/environments/dev/
tfswitch # select the latest terraform version
terraform init
terraform plan
terraform apply --auto-approve

```

This will launch an ECS service serving the app behind an application load balancer
Navigate to the `alb_dns_name` output to check that the app is being served as expected
E.g `curl HelloWorldHexRubyWebRailsLB-333426525.eu-west-2.elb.amazonaws.com`

### Destroy environment

```bash
terraform destroy --auto-approve

```

### Without Docker

1. Start the application:

```bash
npm start

```

2. The API will be available at `http://localhost:3000`
3. Access the OpenAPI documentation at `http://localhost:3000/api-docs`

## Testing

Run the test suite:

```bash
npm test

```

## API Endpoints

- `GET` /v1/greetings: Get all greetings
- `POST` /v1/greetings: Create a new greeting
- `GET` /v1/greeting/{id}: Get a specific greeting
- `PUT` /v1/greeting/{id}: Update a greeting
- `DELETE` /v1/greeting/{id}: Delete a greeting

For detailed API documentation, refer to the OpenAPI specification in `api/greetings.spec.yml` or view the Swagger UI when the applictation is running.

## Contributing

Please read CONTRIBUTING.md for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed und the MIT License - see the LICENSE file for details.

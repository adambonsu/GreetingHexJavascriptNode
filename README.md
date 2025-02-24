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

# Bazario.Docker

## About the Project

**Bazario.Docker** is the centralized _Docker Compose_ project responsible for orchestrating and running all the microservices that make up the Bazario ecosystem. This project provides a unified environment to configure, deploy, and manage the full stack of Bazario services, streamlining both local development and deployment pipelines.

The Bazario system is built on a microservices architecture, with each service encapsulated within its own container. Bazario.Docker simplifies the setup by defining service dependencies, networks, volumes, and environment variables in a single docker-compose.yaml file, allowing developers and operations teams to spin up the entire system with a single command.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Docker](https://www.docker.com/get-started) to run project.
- [Git](https://git-scm.com/downloads) to clone repositories to your local machine.

## Installation

To run this project, it is required to install:

- [Bazario.Web](https://github.com/Bazar-io/Bazario.Web) - Angular project used as the client side web application.
- [Bazario.AspNetCore.Shared](https://github.com/Bazar-io/Bazario.AspNetCore.Shared) - .NET class common library that is used accross .NET microservice projects.
- [Bazario.Identity](https://github.com/Bazar-io/Bazario.Identity) - ASP.NET Core WebAPI that is responsible for handling user authentication and authorization.

To clone the Github repositories:

1. Copy project url for cloning. It should be located at **_Code_ > _Local_ > _HTTPS_**
2. Open git bash in a source folder.
3. Execute commands:

   ```sh
    git clone 'repository url'
   ```

   For example:

   ```sh
    git clone https://github.com/Bazar-io/Bazario.Docker.git
   ```

After cloning all the required repositories your local folder should look like:

Bazario/  
├── Bazario.AspNetCore.Shared/  
├── Bazario.Docker/  
├── Bazario.Identity/  
└── Bazario.Web/

## Running the Application

Before launching the application, ensure the following ports are not occupied:

- `5001` - used by the Bazario.Identity WebAPI _(http port)_
- `5002` - used by the Bazario.Identity WebAPI _(https port)_
- `5432` - used by the Bazario.Identity database
- `4200` - used by the client-side application
- `15672` and `5672` - used by RabbitMQ message broker

To run project, Navigate to `Bazario/Bazario.Docker` and execute the following command:

```sh
docker compose up
```

## Accessing the Application

After running the project, you can access:

- **Client Application**: [http://localhost:4200](http://localhost:4200)
- **Bazario.Identity API**:
  - [http://localhost:5001/scalar](http://localhost:5001/scalar)
  - [https://localhost:5002/scalar](https://localhost:5002/scalar)

## Bugs and Feedback

Found a bug? Have a suggestion? Feel free to [open an issue](https://github.com/Bazar-io/Bazario.Docker/issues) on GitHub. Contributions and feedback are always welcome!

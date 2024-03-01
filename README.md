# Doorstep Services

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)

## Introduction

Welcome to Doorstep Services, a platform that connects service providers with users looking for various services at their doorstep. Whether you need a plumber, electrician, cleaner, or any other service professional, Doorstep Services is here to simplify the process for you.

## Features

- **User-Friendly Interface:** An intuitive interface for users to easily navigate and find the services they need.
- **Service Provider Registration:** Seamless onboarding for service providers to join the platform and offer their services.
- **Service Categories:** A wide range of service categories to cater to diverse user needs.
- **Booking and Scheduling:** Users can book services and schedule appointments based on their convenience.
- **Ratings and Reviews:** Transparent feedback system to help users make informed decisions about service providers.
- **Secure Payments:** Integrated payment system for hassle-free and secure transactions.

## Getting Started

### Prerequisites

Before you begin, ensure you have the following prerequisites:

- [Java](https://www.oracle.com/java/technologies/javase-downloads.html) installed
- [Spring Boot](https://spring.io/projects/spring-boot) installed
- [MySQL](https://www.mysql.com/) installed and running

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/doorstep-services.git
   cd doorstep-services```

2. Set up MySQL database
    - Create a database named doorstep_services in MySQL.
    - Update the database configuration in `src/main/resources/application.properties` with your MySQL credentials.

3. Start the application
    ```./mvnw spring-boot:run```


The application should now be running at http://localhost:8080.


# Clean Advicer

A Flutter application that fetches random advice from an API and displays it to the user.

This project is being developed as a learning exercise to explore **Clean Architecture**, state management, dependency injection, and Flutter development.

## Features

- Fetch random advice from a remote API.
- Display loading, success, and error states.
- Handle API and server errors.
- Switch between light and dark themes.
- Implement state management using **Bloc**.
- Explore **Cubit** as an alternative state management approach.

## Architecture

The project follows a layered architecture inspired by Clean Architecture:

- **Application** – UI, state management, and application services.
- **Domain** – Entities, repository contracts, failures, and use cases.
- **Data** – Models, remote data sources, repository implementations, and exceptions.

## Technologies

- Flutter
- Dart
- Flutter Bloc (Bloc and Cubit)
- Equatable
- Dartz
- HTTP
- Provider

## API

The application uses the [Advice Slip API](https://api.adviceslip.com/advice) to retrieve random advice.

## Credits & Learning Resources

This project is based on concepts and guidance from the Udemy course:

**[Dart & Flutter - Zero to Mastery [2025] + Clean Architecture](https://www.udemy.com/)**

The project is being implemented as part of my learning journey, with modifications and adaptations made during development.

## Purpose

This project is part of my journey learning Flutter development, software architecture, and writing maintainable code. It is a work in progress.

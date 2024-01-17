# Ticket Management App

This Flutter application is designed to manage tickets raised by users. It includes features such as creating tickets with a form, listing all tickets, and utilizing Firebase for data persistence and push notifications. The architecture follows Domain-Driven Design (DDD) principles with Riverpod as the state management solution.

## Domain-Driven Design (DDD) Architecture

The project is structured using Domain-Driven Design (DDD) principles, which emphasizes the importance of modeling the problem domain in the software design process. Key DDD concepts applied in this project include:

- **Entities:** Representing objects with a distinct identity, such as tickets.
- **Value Objects:** Immutables objects without identity, e.g., ticket details.
- **Aggregates:** Grouping of entities and value objects treated as a single unit, ensuring consistency.
- **Repositories:** Providing an interface to access and store aggregates.
- **Use Cases:** Defining application-specific business logic.

This architectural approach enhances code maintainability, scalability, and the alignment of the software design with real-world problem domains.

## Features

- **Ticket Creation Form:**
  - Problem Title
  - Problem Description
  - Location
  - Date (auto-filled as reported date)
  - Attachment

 **Firebase Integration:**
  - Firestore for storing ticket information
  - Firebase Storage for managing ticket attachments
  - Firebase Cloud Messaging for push notifications

- **State Management:**
  - Utilizes Flutter Riverpod for efficient state management

## Dependencies

- `freezed_annotation: ^2.4.1`
- `json_annotation: ^4.8.1`
- `dartz: ^0.10.1`
- `firebase_core: ^2.24.2`
- `cloud_firestore: ^4.14.0`
- `firebase_storage: ^11.6.0`
- `firebase_app_check: ^0.2.1+8`
- `flutter_riverpod: ^2.4.9`
- `file_picker: ^6.1.1`
- `another_flushbar: ^1.12.30`
- `firebase_messaging: ^14.7.10`
- `flutter_local_notifications: ^16.3.0`
- `url_launcher: ^6.2.3`
- `http: ^1.1.2`

## Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/ticket-management-app.git

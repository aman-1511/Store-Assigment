# Sales Task Tracker

A Flutter application for salespersons to track their sales activities offline and sync with Firebase when internet access is available.

## Features

- Add sales tasks with shop name, product details, quantity, and amount
- Store tasks locally using SQLite
- Sync tasks with Firebase Firestore when internet is available
- View all tasks with sync status
- Simple and intuitive UI

## Demo Images
![Image](https://github.com/user-attachments/assets/4707f241-189a-4720-9ede-5dd5e9763ea1)

![Image](https://github.com/user-attachments/assets/77ead123-0c0d-4294-9d6a-c5d8b93ec8a9)

## Demo Video
https://github.com/user-attachments/assets/6af53796-7199-47e9-a024-cd449546b4a0

## Setup Instructions

1. Clone the repository
2. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```

3. Firebase Setup:
   - Create a new Firebase project
   - Add Android and iOS apps to your Firebase project
   - Download and add the `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) files to your project
   - Enable Firestore in your Firebase project

4. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

- `lib/models/task.dart`: Task model class
- `lib/services/database_helper.dart`: SQLite database helper
- `lib/services/firebase_service.dart`: Firebase Firestore service
- `lib/providers/task_provider.dart`: State management using Provider
- `lib/screens/dashboard_screen.dart`: Main dashboard screen
- `lib/screens/new_task_screen.dart`: Screen for adding new tasks

## Usage

1. Open the app to see the dashboard
2. Tap the + button to add a new task
3. Fill in the task details and save
4. Tasks are stored locally first
5. Tap the sync button in the app bar to sync tasks with Firebase
6. View sync status for each task (cloud icon)

## Dependencies

- flutter: SDK
- provider: ^6.1.1
- sqflite: ^2.3.0
- firebase_core: ^2.24.2
- cloud_firestore: ^4.14.0
- intl: ^0.19.0
- uuid: ^4.3.3
- connectivity_plus: ^5.0.2

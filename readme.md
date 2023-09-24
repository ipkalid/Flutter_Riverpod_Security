# Flutter App with Riverpod and Security in Mind

This repository contains a Flutter app that demonstrates how to use the Riverpod State Management. The app contains two screens login and home screen.

## Table of Contents

- [Features](#features)
- [Obtaining a New York Times API Key](#obtaining-a-new-york-times-api-key)
- [Installation](#installation)
- [Usage](#usage)
- [Dependencies](#dependencies)
- [Contributing](#contributing)
- [License](#license)

## Features

- Authentication.
- Implements the Riverpod State Management.
- Uses GetIt for dependency injection.
- Implement Scalable Network Layer.
- Implement Security related to jailbroken and rooted devices

## Running the spring boot server

open the backend folder using IntelliJ IDEA and run it make sure the port 8080 is free to use

## Installation

To run the app locally, please follow these steps:

1. Ensure that you have Flutter SDK installed on your machine. If not, refer to the [official Flutter installation guide](https://flutter.dev/docs/get-started/install) for instructions on setting up Flutter.
2. Clone this GitHub repository using Git or download the ZIP file.
3. Open the project in your preferred Flutter IDE or editor (e.g., Android Studio, VS Code).
4. Install the project dependencies by running the following command in the terminal:

   ```bash
   flutter pub get
   ```

5. Connect a device or start an emulator.
6. Run the app using the following command:

   ```bash
   flutter run
   ```

   The app should now be running on your device/emulator.

## Usage

Once the app is installed and running, you can test running the app and see how we keep the user info safe in the keychain of iOS or encrypted database on android .

Feel free to explore the codebase to understand the implementation details of the Riverpod State Management, API integration, and Get_it for dependency injection. Make modifications, experiment with different features, and customize the app according to your needs.

## Dependencies

The app relies on the following dependencies:

- [flutter_riverpod](https://pub.dev/packages/flutter_jailbreak_detection) - A state management library.
- [http](https://pub.dev/packages/http) - A package for making HTTP requests to the New York Times API.
- [url_launcher](https://pub.dev/packages/url_launcher) - A package for launching URLs.
- [http](https://pub.dev/packages/http) - The HTTP client for Dart that supports various request features.
- [get_it](https://pub.dev/packages/get_it): A simple service locator for dependency injection.
- [http](https://pub.dev/packages/http) - The HTTP client for Dart that supports various request features.
- [flutter_jailbreak_detection](https://pub.dev/packages/flutter_jailbreak_detection): a package for knowing if the device is rooted or jailbroken
- [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage): a package for using secure storage for iOS and Android.

For more details on the exact versions used, please refer to the pubspec.yaml file.
These dependencies are automatically resolved and fetched from the Dart package repository (pub.dev) during the installation process.

## Contributing

Contributions to this project are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request. Make sure to follow the project's code style and guidelines.

To contribute to the project, follow these steps:

1. Fork this repository.
2. Create a new branch for your feature or bug fix.
3. Make the necessary changes and commit your code.
4. Push your changes to your forked repository.
5. Submit a pull request to the original repository.

Please provide a detailed explanation of your changes and ensure that your code adheres to the project's coding conventions.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use and modify the code as per the terms of the license.

# URL Shorty

URL shortening app which showcases clean architecture with custom dependency injection solution. It uses Dart's native
`HttpClient` for networking and [Hive](https://docs.hivedb.dev/#/) database for local persistence. State management is
handled by [BLoC](https://bloclibrary.dev/#/).

## Usage

Make sure you have the latest stable version of Flutter toolkit installed on your system. This project was developed with
Flutter 2.5.3 with Dart version 2.14.4.

```bash
# Install dependencies
flutter pub get

# Run code generation
flutter packages pub run build_runner build

# Run the app (have emulator ready)
flutter run
```

# template

# 🚀 Flutter Clean Architecture Template

A modern, scalable Flutter boilerplate project following **Clean Architecture**, pre-configured with **Riverpod**, **Freezed**, **Dio**, and more — ready to launch your next mobile app with best practices.

---

## 🧱 Project Structure


---

## 🚀 Features

- ✅ Clean Architecture
- ✅ Riverpod (state management)
- ✅ Dio (network layer)
- ✅ Freezed & JsonSerializable (model generation)
- ✅ Custom error handling & result types
- ✅ Folder-by-feature scalable structure
- ✅ Ready for localization and themes
- ✅ Built-in `.env` file support (via `flutter_dotenv`)
- ✅ IDE-friendly with `analysis_options.yaml`

---

## 🔧 Tech Stack

| Tool            | Usage                          |
|-----------------|---------------------------------|
| [Riverpod]      | State management                |
| [Freezed]       | Data classes & unions           |
| [Dio]           | HTTP client                     |
| [retrofit]      | REST API generator              |
| [build_runner]  | Code generation                 |
| [flutter_dotenv]| Environment config              |

---

## ⚙️ Getting Started

```bash
# 1. Clone the repository
git clone git@github.com:FarhanAli-98/flutter-boilerplate.git

# 2. Install dependencies
flutter pub get

# 3. Generate code
flutter pub run build_runner build --delete-conflicting-outputs

# 4. Run the app
flutter run
# flutter-boilerplate

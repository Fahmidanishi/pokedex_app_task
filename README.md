# Pokédex Flutter App (Intern Task)

## Project Title and Description
A simple Pokédex Flutter application built to demonstrate:
- Flutter UI
- BLoC state management (`flutter_bloc`)
- API integration with the PokéAPI

The app includes two screens:
1. **Pokémon List Screen** – Horizontal scrolling list of Pokémon names.
2. **Pokémon Detail Screen** – Displays details such as name, height, weight, and image.

---

## Technical Stack
- Flutter (3.x – latest stable)
- Dart
- flutter_bloc
- http
- equatable

---

## Project Structure / Approach

lib/
├── data/
│ ├── models/
│ │ ├── pokemon_detail.dart
│ │ └── pokemon_list_item.dart
│ └── repository/
│ └── pokemon_repository.dart
├── logic/
│ ├── pokemon_detail/
│ │ ├── pokemon_detail_bloc.dart
│ │ ├── pokemon_detail_event.dart
│ │ └── pokemon_detail_state.dart
│ └── pokemon_list/
│ ├── pokemon_list_bloc.dart
│ ├── pokemon_list_event.dart
│ └── pokemon_list_state.dart
├── presentation/
│ ├── screens/
│ │ ├── pokemon_detail_screen.dart
│ │ └── pokemon_list_screen.dart
│ └── widgets/
│ └── pokemon_card.dart
└── main.dart

**Architecture:** Layered architecture:
- **Data Layer:** API + repositories
- **Logic Layer:** Two BLoCs (`pokemon_list_bloc`, `pokemon_detail_bloc`)
- **Presentation Layer:** Screens & widgets

---

## Generative AI Usage
Used ChatGPT for guidance on:
- Implementing BLoC for API fetching
- Designing layered architecture
- Handling loading and error states

**Example prompts:**
- “How to fetch data from PokéAPI and display using Flutter BLoC?”
- “Flutter BLoC API handling best practices”

---

## How to Run

### Running via Flutter (Developers)

```bash
git clone https://github.com/Fahmidanishi/pokedex_app_task
cd pokedex_app_task
flutter pub get
flutter run

Installing the Release APK (Android Users)

Download APK:
 https://drive.google.com/file/d/1nPbKg94SBNbUMcq3glP-eQp-IO28q6QN/view?usp=sharing 

Screenshots
assets/screens/list_screen.jpg
assets/screens/detail_screen.jpg

Links

GitHub Repository: https://github.com/Fahmidanishi/pokedex_app_task

APK Download: https://drive.google.com/file/d/1nPbKg94SBNbUMcq3glP-eQp-IO28q6QN/view?usp=sharing 


# Pokédex Flutter App (Intern Task)

## Project Title and Description
A simple Pokédex Flutter application built to demonstrate:

- Flutter UI
- BLoC state management (`flutter_bloc`)
- API integration with the PokéAPI

The app has two screens:

1. **Pokémon List Screen** – Displays a horizontal scroll of Pokémon names in a clean card view.
2. **Pokémon Detail Screen** – Shows details of a Pokémon, including its name, height, weight, and image.

---

## Technical Stack
- Flutter (latest stable version)
- Dart
- `flutter_bloc` (for state management)
- `http` (for API calls)
- `equatable` (for value equality in BLoC states)

---

## Project Structure / Approach

The project follows a **layered architecture** using BLoC for state management, separating UI, business logic, and data layers.

- `lib/`
    - `main.dart` – Entry point of the application
    - `data/` – Handles models and repositories
        - `models/`
            - `pokemon_detail.dart` – Model for Pokémon details
            - `pokemon_list_item.dart` – Model for Pokémon list items
        - `repository/`
            - `pokemon_repository.dart` – API calls to fetch Pokémon data
    - `logic/` – Business logic layer (BLoC)
        - `pokemon_list/`
            - `pokemon_list_bloc.dart` – BLoC for Pokémon list
            - `pokemon_list_event.dart` – Events for Pokémon list BLoC
            - `pokemon_list_state.dart` – States for Pokémon list BLoC
        - `pokemon_detail/`
            - `pokemon_detail_bloc.dart` – BLoC for Pokémon detail
            - `pokemon_detail_event.dart` – Events for Pokémon detail BLoC
            - `pokemon_detail_state.dart` – States for Pokémon detail BLoC
    - `presentation/` – UI layer
        - `screens/`
            - `pokemon_list_screen.dart` – Screen displaying Pokémon list
            - `pokemon_detail_screen.dart` – Screen displaying Pokémon details
        - `widgets/`
            - `pokemon_card.dart` – Reusable widget for Pokémon cards

> This structure ensures a clean separation of concerns: the `data` layer handles models and repositories, the `logic` layer handles BLoC state management, and the `presentation` layer handles UI screens and widgets.

---

## Generative AI Usage
- Used ChatGPT for guidance on:
    - Implementing BLoC for API fetching
    - Handling loading, success, and error states in Flutter BLoC
    - Structuring Flutter project with layered architecture
- Example prompts:
    - *"How to fetch data from PokéAPI and display in a horizontal list using Flutter BLoC?"*
    - *"Flutter BLoC pattern example for handling API states"*

---

## How to Run

1. Clone the repository:
   ```bash
   git clone <your-repo-url>

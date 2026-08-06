# 🎟️ Snaptix — Event Ticketing App

A beautifully crafted Flutter application for discovering, saving, and booking event tickets. Built with a clean architecture approach, Snaptix delivers a premium mobile experience powered by BLoC state management and modern Flutter best practices.

### 🧰 Built With

| Tool         | Version                   |
| ------------ | ------------------------- |
| **Flutter**  | `3.44.8` (stable channel) |
| **Dart**     | `3.12.2`                  |
| **DevTools** | `2.57.0`                  |

---

## 📱 Features

| Feature                     | Description                                       |
| --------------------------- | ------------------------------------------------- |
| 🔍 **Explore**              | Browse and search events with real-time filtering |
| 🎫 **Tickets**              | View and manage your purchased tickets            |
| 💾 **Saved Events**         | Bookmark events you're interested in              |
| 📋 **Event Detail**         | Rich event detail page with full information      |
| ✅ **Booking Confirmation** | Seamless ticket booking confirmation flow         |
| 👤 **Profile**              | User profile management                           |
| 🔐 **Authentication**       | Sign In / Sign Up flows                           |
| 🚀 **Onboarding**           | Guided onboarding experience for new users        |

---

## 📦 Packages Used

### Dependencies

| Package                                                                 | Version   | Description                                                        |
| ----------------------------------------------------------------------- | --------- | ------------------------------------------------------------------ |
| [`flutter_bloc`](https://pub.dev/packages/flutter_bloc)                 | `^9.1.1`  | State management using the BLoC (Business Logic Component) pattern |
| [`go_router`](https://pub.dev/packages/go_router)                       | `^17.3.0` | Declarative routing with deep linking and URL-based navigation     |
| [`google_fonts`](https://pub.dev/packages/google_fonts)                 | `^8.2.1`  | Access to Google Fonts (Inter, Space Grotesk) at runtime           |
| [`flutter_screenutil`](https://pub.dev/packages/flutter_screenutil)     | `^5.9.3`  | Responsive UI scaling across different screen sizes                |
| [`flutter_svg`](https://pub.dev/packages/flutter_svg)                   | `^2.3.0`  | Render SVG vector assets natively in Flutter                       |
| [`cached_network_image`](https://pub.dev/packages/cached_network_image) | `^3.4.1`  | Download, cache, and display network images with placeholders      |
| [`equatable`](https://pub.dev/packages/equatable)                       | `^2.1.0`  | Simplify value equality for BLoC states and events                 |
| [`gap`](https://pub.dev/packages/gap)                                   | `^3.0.1`  | Clean spacing widget — a drop-in replacement for `SizedBox`        |
| [`cupertino_icons`](https://pub.dev/packages/cupertino_icons)           | `^1.0.8`  | iOS-style icons from the Cupertino design system                   |

### Dev Dependencies

| Package                                                                     | Version   | Description                                             |
| --------------------------------------------------------------------------- | --------- | ------------------------------------------------------- |
| [`flutter_lints`](https://pub.dev/packages/flutter_lints)                   | `^6.0.0`  | Recommended linting rules for Flutter projects          |
| [`flutter_launcher_icons`](https://pub.dev/packages/flutter_launcher_icons) | `^0.14.4` | Auto-generate adaptive launcher icons for Android & iOS |

---

## 🏗️ Architecture

This project follows **Clean Architecture** principles, organized by feature with three distinct layers:

```
lib/
├── app/                        # App entry widget (MyApp)
├── core/                       # Shared infrastructure
│   ├── constants/              # App-wide constants & colors
│   ├── errors/                 # Error types & failures
│   ├── extensions/             # Dart extension methods
│   ├── network/                # Network utilities
│   ├── routes/                 # Go Router setup & route names
│   ├── services/               # Core services
│   ├── theme/                  # App theme, colors, text styles
│   └── utils/                  # Utility helpers
├── features/                   # Feature modules
│   ├── auth/                   # Sign In / Sign Up
│   ├── confirmation/           # Booking confirmation
│   ├── event_detail/           # Event detail page
│   ├── explore/                # Discover & search events
│   ├── main/                   # Bottom navigation shell
│   ├── onboarding/             # Onboarding screens
│   ├── profile/                # User profile
│   ├── saved/                  # Saved/bookmarked events
│   ├── splash/                 # Splash screen
│   └── tickets/                # My tickets
├── shared/                     # Shared models & widgets
│   ├── models/                 # Shared data models
│   └── widgets/                # Reusable UI components
├── injection_container.dart    # Dependency injection setup
└── main.dart                   # App entry point
```

Each feature follows the standard Clean Architecture pattern:

```
feature/
├── data/
│   ├── datasources/            # Local / remote data sources
│   ├── models/                 # Data transfer objects (DTOs)
│   └── repositories/           # Repository implementations
├── domain/
│   ├── entities/               # Business entities
│   ├── repositories/           # Repository contracts (abstract)
│   └── usecases/               # Business logic / use cases
└── presentation/
    ├── bloc/                   # BLoC (Event, State, Bloc)
    ├── pages/                  # Screen widgets
    └── widgets/                # Feature-specific UI components
```

---

## 🎨 Design System

Snaptix uses a consistent design system defined in `lib/core/theme/`:

- **Primary Font**: `Inter` (body text)
- **Display Font**: `Space Grotesk` (headlines & titles)
- **Color Palette**: Defined in `AppColors` — background, surface, primary, accent, error, borders, and text tokens
- **Theming**: Material 3 with a custom light theme (`AppTheme.lightTheme`)
- **Responsive Units**: All spacing, sizes, and font sizes use `flutter_screenutil` (`.sp`, `.h`, `.w`, `.r`)

---

## 🧭 Navigation

Routing is handled by `go_router`. Named routes are defined in `AppRoutes`:

| Route Constant           | Path              | Screen                  |
| ------------------------ | ----------------- | ----------------------- |
| `AppRoutes.splash`       | `/`               | Splash Screen           |
| `AppRoutes.onboarding`   | `/onboarding`     | Onboarding              |
| `AppRoutes.signIn`       | `/signIn`         | Sign In                 |
| `AppRoutes.signUp`       | `/signUp`         | Sign Up                 |
| `AppRoutes.main`         | `/mainNavigation` | Main Shell (Bottom Nav) |
| `AppRoutes.explore`      | `/explore`        | Explore Events          |
| `AppRoutes.savedEvent`   | `/savedEvent`     | Saved Events            |
| `AppRoutes.ticket`       | `/ticket`         | My Tickets              |
| `AppRoutes.eventDetail`  | `/eventDetail`    | Event Detail            |
| `AppRoutes.confirmation` | `/confirmation`   | Booking Confirmation    |
| `AppRoutes.profile`      | `/profile`        | User Profile            |

---

## 📦 Assets

```
assets/
├── fonts/      # Custom font files
├── icons/      # App icons (including launcher icon)
├── images/     # Static image assets
├── json/       # Local JSON data files
└── svg/        # SVG vector assets
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `>=3.12.2`
- Dart SDK `^3.12.2`
- Android Studio / VS Code with Flutter extension

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/shiv4mand4l/Snaptix.git
   cd Snaptix
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   ```bash
   flutter run
   ```

4. **(Optional) Generate launcher icons**
   ```bash
   flutter pub run flutter_launcher_icons
   ```

---

## 📂 Key Files

| File                              | Purpose                                               |
| --------------------------------- | ----------------------------------------------------- |
| `lib/main.dart`                   | App entry point — wires up all repositories and BLoCs |
| `lib/app/my_app.dart`             | Root widget with theme and router setup               |
| `lib/core/routes/app_router.dart` | Go Router configuration                               |
| `lib/core/routes/app_routes.dart` | Named route constants                                 |
| `lib/core/theme/app_theme.dart`   | Material 3 theme configuration                        |
| `lib/core/constants/`             | App-wide constants (colors, strings, etc.)            |
| `pubspec.yaml`                    | Project dependencies and asset declarations           |

---

## 🧩 State Management

Each feature uses the **BLoC pattern** with `flutter_bloc`:

- **`NavigationBloc`** — controls the bottom navigation tab index
- **`ExploreBloc`** — loads events, handles search and favourites
- **`EventDetailBloc`** — fetches event detail by ID
- **`TicketsBloc`** — loads the user's purchased tickets
- **`SavedEventsBloc`** — manages saved/bookmarked events

All BLoCs are provided at the root level in `main.dart` using `MultiBlocProvider`.

---

## 📋 Scripts

```bash
# Run in debug mode
flutter run

# Analyze code
flutter analyze

# Run tests
flutter test

# Build APK (release)
flutter build apk --release

# Build iOS (release)
flutter build ios --release

# Generate app icons
flutter pub run flutter_launcher_icons
```

---

## 📄 License

This project is for demonstration and learning purposes.

---

_Built with ❤️ by Shivam Mandal_

# Rybbit Mobile

[![Google Play](https://img.shields.io/badge/Google%20Play-com.nkshub.rybbit__unofficial-414141?logo=googleplay&logoColor=white)](https://play.google.com/store/apps/details?id=com.nkshub.rybbit_unofficial)
[![Flutter](https://img.shields.io/badge/Flutter-3.38+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Android](https://img.shields.io/badge/Android-5.0+-3DDC84?logo=android&logoColor=white)](#compatibility)
[![iOS](https://img.shields.io/badge/iOS-13+-000000?logo=apple&logoColor=white)](#compatibility)
[![Languages](https://img.shields.io/badge/languages-11-ff6b6b)](#supported-languages)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE)

> Unofficial Flutter mobile client for [Rybbit](https://github.com/rybbit-io/rybbit) — open-source, privacy-friendly web analytics.

<p align="center">
  <img src="screenshots/dashboard_en.png" width="200" alt="Dashboard">
  &nbsp;&nbsp;
  <img src="screenshots/analytics_en.png" width="200" alt="Analytics">
  &nbsp;&nbsp;
  <img src="screenshots/sessions_en.png" width="200" alt="Sessions">
  &nbsp;&nbsp;
  <img src="screenshots/settings_full_en.png" width="200" alt="Settings">
</p>

<details>
<summary>More screenshots</summary>
<p align="center">
  <img src="screenshots/countries_en.png" width="200" alt="Countries">
  &nbsp;&nbsp;
  <img src="screenshots/pages_en.png" width="200" alt="Pages">
  &nbsp;&nbsp;
  <img src="screenshots/session_expanded_en.png" width="200" alt="Session Detail">
</p>
</details>

## Features

- 📊 **Dashboard & analytics** - multi-site dashboard with real-time visitor counts and organization filtering, time-series charts with period comparison (current vs previous), selectable metrics (users, sessions, pageviews, pages/session, bounce rate, duration), flexible time range picker (today, yesterday, 7/30 days, week, month, year, custom), and advanced filtering by country, browser, OS, device, referrer, pathname and more
- 📈 **Detailed metrics** - top pages with visitor and session counts, referrer breakdown, countries with flag indicators, and browser / OS / device type / screen resolution stats
- ⚡ **Performance (Core Web Vitals)** - LCP, CLS, FCP, TTFB and INP monitoring with Good / Needs Improvement / Poor ratings, trends over time, and breakdown by pages, countries, devices, browsers and OS
- 🎯 **Events & custom tracking** - custom event names with occurrence counts, event properties breakdown, events over time chart, and outbound links tracking
- 🏁 **Goals & funnels** - goal creation/editing (path-based and event-based), conversion rate tracking, and funnel visualization with step-by-step dropoff analysis
- 👥 **Sessions & users** - session list with country flags, browser info and entry pages, session detail with full event timeline, identified users with traits (username, email), and session replay event viewer
- 🐛 **Error tracking** - JavaScript error list with occurrence counts and sessions affected per error
- 🛠️ **Site management** - site configuration (tracking toggles, excluded IPs/countries) and organization management with member listing
- 🎨 **Settings** - Dark / Light / Auto theme, 11 languages, server connection and auth method display

## Requirements

- Flutter SDK 3.38+ (Dart 3.10+)
- Android SDK / Xcode (for iOS)
- A running [Rybbit](https://github.com/rybbit-io/rybbit) instance (Rybbit v1.0+) or Rybbit Cloud

## Installation

**Google Play** — [com.nkshub.rybbit_unofficial](https://play.google.com/store/apps/details?id=com.nkshub.rybbit_unofficial), released to production in 177 countries. A release goes live once Google finishes reviewing it, so a freshly submitted version can take a day or two to show up on the listing.

**From source** — Android 5.0+ and iOS are supported; iOS has no store build, so it has to be built and signed locally.

```bash
git clone https://github.com/nks-hub/rybbit-app.git
cd rybbit-app

# Install dependencies
flutter pub get

# Generate code (Freezed models, JSON serialization)
flutter pub run build_runner build --delete-conflicting-outputs

# Generate localizations
flutter gen-l10n

# Run
flutter run
```

The app is a client only. It talks to your own Rybbit instance (or Rybbit Cloud) and stores nothing of its own beyond the server URL and session.

## Configuration

### Environment

Copy `.env.example` to `.env` and fill in your values:

```bash
cp .env.example .env
```

The `.env` file is loaded at build time via `--dart-define-from-file`:

```bash
# Run with .env
flutter run --dart-define-from-file=.env

# Build with .env
flutter build apk --dart-define-from-file=.env
```

Currently supported variables:

| Variable | Required | Description |
|----------|----------|-------------|
| `SENTRY_DSN` | No | Sentry error tracking DSN. App works without it. |

### Authentication

Two auth methods supported:

1. **Email + Password** — Standard login with session cookies
2. **API Key** — Direct API key authentication

Enter your Rybbit server URL (e.g. `https://analytics.example.com`) and credentials on the login screen.

## Supported Languages

| Language | Code | Language | Code |
|----------|------|----------|------|
| English | `en` | Japanese | `ja` |
| Czech | `cs` | Korean | `ko` |
| German | `de` | Polish | `pl` |
| Spanish | `es` | Portuguese | `pt` |
| French | `fr` | Chinese | `zh` |
| Italian | `it` | | |

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Flutter 3.38+ / Dart 3.10+ |
| State Management | Riverpod |
| Routing | go_router |
| HTTP Client | Dio with cookie management |
| Local Storage | shared_preferences + Flutter Secure Storage |
| Charts | fl_chart |
| Serialization | Freezed + json_serializable |
| Localization | Flutter gen-l10n (ARB files) |
| Error Tracking | Sentry (optional, via `--dart-define`) |

## Architecture

Feature-first modular architecture:

```
lib/
├── core/
│   ├── config/         # App configuration
│   ├── network/        # Dio provider, auth interceptor
│   ├── router/         # go_router setup, shell screen
│   ├── sentry/         # Sentry initialization
│   ├── state/          # Current site provider
│   ├── storage/        # Local storage service
│   └── theme/          # Light & dark Material themes
├── features/
│   ├── analytics/      # Overview, charts, time range
│   ├── auth/           # Login (email/password + API key)
│   ├── dashboard/      # Site listing, org filter
│   ├── errors/         # JS error tracking
│   ├── events/         # Custom events, properties
│   ├── funnels/        # Conversion funnels
│   ├── goals/          # Goal CRUD + conversion stats
│   ├── metrics/        # Pages, referrers, countries, devices
│   ├── organizations/  # Org listing + members
│   ├── performance/    # Core Web Vitals
│   ├── session_replay/ # Replay event viewer
│   ├── sessions/       # Session list + detail
│   ├── settings/       # Theme, language, account
│   ├── sites/          # Site config management
│   └── users/          # User list + detail + traits
├── l10n/               # ARB translation files
└── shared/
    ├── models/         # Freezed data models
    ├── utils/          # Formatters, helpers
    └── widgets/        # Reusable UI components
```

Each feature follows: `data/` (API) → `application/` (state) → `presentation/` (UI)

## Compatibility

| Platform | Minimum |
|----------|---------|
| Android | API 21 (5.0 Lollipop) |
| iOS | 13.0 |
| Backend | Rybbit v1.0+ |

## Development

```bash
# Debug (with .env)
flutter run -d <device-id> --dart-define-from-file=.env

# Build APK (debug / release)
flutter build apk --debug --dart-define-from-file=.env
flutter build apk --release --dart-define-from-file=.env

# Code generation (after model changes)
flutter pub run build_runner build --delete-conflicting-outputs

# Translations (after ARB changes)
flutter gen-l10n

# Analyze
flutter analyze

# Tests
flutter test
```

### Adding a New Language

1. Create `lib/l10n/app_<code>.arb` based on `app_en.arb`
2. Translate all keys
3. Add locale code to `supportedLocaleCodes` in `lib/app.dart`
4. Add display name to `localeDisplayNames` in `lib/app.dart`
5. Run `flutter gen-l10n`

## Contributing

Contributions are welcome! For major changes, please open an issue first.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: description'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Support

- 📧 **Email:** dev@nks-hub.cz
- 🐛 **Bug reports:** [GitHub Issues](https://github.com/nks-hub/rybbit-app/issues)

## License

GNU General Public License v3.0 — see [LICENSE](LICENSE) for details.

This is an unofficial community project. Rybbit is developed by [rybbit-io](https://github.com/rybbit-io/rybbit).

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/nks-hub">NKS Hub</a>
</p>

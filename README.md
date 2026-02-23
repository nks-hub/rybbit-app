# Rybbit Mobile

Unofficial Flutter mobile client for [Rybbit](https://github.com/rybbit-io/rybbit) — open-source, privacy-friendly web analytics platform.

Built and maintained by [NKS Hub](https://nks-hub.cz) (dev@nks-hub.cz).

## Features

### Dashboard & Analytics
- Multi-site dashboard with real-time visitor counts
- Time-series charts with period comparison (current vs previous)
- Selectable metrics: users, sessions, pageviews, pages/session, bounce rate, duration
- Flexible time range picker (today, yesterday, 7/30 days, week, month, year, custom)
- Advanced filtering by country, browser, OS, device, referrer, pathname and more

### Detailed Metrics
- **Pages** — top pages with visitor and session counts
- **Referrers** — traffic sources breakdown
- **Countries** — geographic distribution with flag indicators
- **Devices** — browser, OS, device type, screen resolution stats

### Performance (Core Web Vitals)
- LCP, CLS, FCP, TTFB, INP monitoring
- Good/Needs Improvement/Poor ratings with color coding
- Performance trends over time
- Breakdown by dimension (pages, countries, devices, browsers, OS)

### Events & Custom Tracking
- Custom event names overview with occurrence counts
- Event properties breakdown per event
- Events over time chart
- Outbound links tracking

### Goals & Funnels
- Goal creation/editing (path-based and event-based)
- Conversion rate tracking
- Funnel visualization with step-by-step dropoff analysis
- Overall conversion percentage

### Sessions & Users
- Session list with country flags, browser info, entry pages
- Session detail with full event timeline
- User list with search, sort, and identified/anonymous filtering
- User detail with traits and session history
- Session replay event viewer

### Error Tracking
- JavaScript error list with occurrence counts
- Sessions affected per error

### Site Management
- Site configuration (tracking toggles, excluded IPs/countries)
- Organization management with member listing

### Settings
- Dark/Light/Auto theme switching
- Language selection with 11 languages
- Server connection and auth method display

## Supported Languages

Full localization with 290+ translation keys per language:

| Language | Code |
|----------|------|
| English | `en` |
| Czech (Cestina) | `cs` |
| German (Deutsch) | `de` |
| Spanish (Espanol) | `es` |
| French (Francais) | `fr` |
| Italian (Italiano) | `it` |
| Japanese | `ja` |
| Korean | `ko` |
| Polish (Polski) | `pl` |
| Portuguese (Portugues) | `pt` |
| Chinese | `zh` |

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Flutter 3.38+ / Dart 3.10+ |
| State Management | Riverpod |
| Routing | go_router |
| HTTP Client | Dio with cookie management |
| Local Storage | Hive + Flutter Secure Storage |
| Charts | fl_chart |
| Serialization | Freezed + json_serializable |
| Localization | Flutter gen-l10n (ARB files) |
| Testing | flutter_test + mocktail |

## Architecture

Feature-first modular architecture:

```
lib/
├── app.dart                    # App root, locale/theme providers
├── main.dart                   # Entry point, Hive init
├── core/
│   ├── config/                 # App configuration
│   ├── network/                # Dio provider, auth interceptor
│   ├── router/                 # go_router setup, shell screen
│   ├── state/                  # Current site provider
│   ├── storage/                # Hive storage service
│   └── theme/                  # Light & dark Material themes
├── features/
│   ├── analytics/              # Main analytics (overview, charts, time range)
│   ├── auth/                   # Login (email/password + API key)
│   ├── dashboard/              # Site listing, site cards
│   ├── errors/                 # JS error tracking
│   ├── events/                 # Custom events, properties, outbound links
│   ├── funnels/                # Conversion funnels
│   ├── goals/                  # Goal CRUD + conversion stats
│   ├── metrics/                # Pages, referrers, countries, devices
│   ├── organizations/          # Org listing + members
│   ├── performance/            # Core Web Vitals, dimensions
│   ├── session_replay/         # Replay event viewer
│   ├── sessions/               # Session list + detail + timeline
│   ├── settings/               # Theme, language, account
│   ├── sites/                  # Site config management
│   └── users/                  # User list + detail + traits
├── l10n/                       # ARB translation files + generated code
└── shared/
    ├── models/                 # Freezed data models
    ├── utils/                  # Formatters, helpers
    └── widgets/                # Reusable UI components
```

Each feature follows the pattern:
- `data/` — Repository with API calls
- `application/` — Controllers/state management
- `presentation/` — Screens and widgets

## Getting Started

### Prerequisites

- Flutter SDK 3.38+
- Android SDK / Xcode (for iOS)
- A running [Rybbit](https://github.com/rybbit-io/rybbit) instance

### Setup

```bash
# Clone
git clone https://github.com/nks-hub/rybbit-app.git
cd rybbit-app

# Install dependencies
flutter pub get

# Generate code (Freezed models, JSON serialization)
flutter pub run build_runner build --delete-conflicting-outputs

# Generate localizations
flutter gen-l10n

# Run on connected device/emulator
flutter run
```

### Authentication

The app supports two authentication methods:

1. **Email + Password** — Standard login with session cookies
2. **API Key** — Direct API key authentication

Enter your Rybbit server URL (e.g., `https://analytics.example.com`) and credentials on the login screen.

## Development

```bash
# Run in debug mode
flutter run -d <device-id>

# Build debug APK
flutter build apk --debug

# Build release APK
flutter build apk --release

# Run code generation (after model changes)
flutter pub run build_runner build --delete-conflicting-outputs

# Regenerate translations (after ARB changes)
flutter gen-l10n

# Analyze code
flutter analyze

# Run tests
flutter test
```

### Adding a New Language

1. Create `lib/l10n/app_<code>.arb` based on `app_en.arb`
2. Translate all keys
3. Add locale code to `supportedLocaleCodes` in `lib/app.dart`
4. Add display name to `localeDisplayNames` in `lib/app.dart`
5. Run `flutter gen-l10n`

## Compatibility

- **Android**: API 21+ (Android 5.0 Lollipop)
- **iOS**: iOS 12+
- **Backend**: Rybbit v1.0+

## License

This is an unofficial community project. Rybbit is developed by [rybbit-io](https://github.com/rybbit-io/rybbit).

---

Developed by [NKS Hub](https://nks-hub.cz) | Contact: dev@nks-hub.cz

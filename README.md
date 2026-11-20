# alzefr_dash

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Firebase project mapping

The visitor counters are written anonymously by the customer app
(`elzefir/lib/features/visitor_tracking`) and read here from `stats/visitors`.

| Build | Firebase project used |
| --- | --- |
| Customer app — dev | `elzefir-dev` |
| Customer app — prod | `elzefir-dev` (despite hosting on `elzefir-dbb8d`) |
| Dashboard — default `ENV=dev` | `elzefir-dev` ✅ sees the visitor stats |
| Dashboard — `ENV=prod` | `elzefir-dbb8d` ⚠️ does **not** see them |

Deploy the dashboard with the default env for visitor stats to appear. Moving
the customer app to `elzefir-dbb8d` must be done only after confirming its
`products` and `categories` collections exist there.

Firestore rules for the new collections live in `firestore.rules` at this repo
root and are deployed from here with `firebase deploy --only firestore:rules`.

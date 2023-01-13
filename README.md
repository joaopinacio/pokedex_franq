# Pokedex Franq

# Commands
## Build Runner
```flutter packages pub run build_runner build --delete-conflicting-outputs```
```flutter packages pub run build_runner watch --delete-conflicting-outputs```

# Structure

├── lib
│   ├── app
│   │   ├── core
│   │   │   ├── enums
│   │   │   ├── injectable
│   │   │   ├── routes
│   │   │   ├── translate
│   │   │   └── utils
│   │   ├── feature
│   │   │   └── {some_page}
│   │   │       ├── data
│   │   │       │   ├── datasource
│   │   │       │   ├── model
│   │   │       │   └── repository
│   │   │       ├── domain
│   │   │       │   ├── entity
│   │   │       │   ├── repository
│   │   │       │   └── usecase
│   │   │       └── presenter
│   │   │           ├── store
│   │   │           └── pages
│   │   └── layout
│   │       ├── components
│   │       └── themes
│   │           ├── colors
│   │           ├── icons
│   │           └── images
│   ├── main_dependencies.dart
│   └── main.dart
├── pubspec.lock
└── pubspec.yaml
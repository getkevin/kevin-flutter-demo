![kevin.](./images/logo.png)

A kevin. SDK Flutter demo app

The kevin. SDK enables to easily integrate AIS and PIS services in your mobile application. We provide neat, customisable UI screens so integration would be as quick as possible. We also expose the low-level APIs that power those UIs so that you can build fully custom experiences.

Get started with our [SDK reference](https://developer.kevin.eu/mobile/) and also checkout our native [iOS Demo App](https://github.com/getkevin/kevin-ios/tree/master/demo) or [Android Demo App](https://github.com/getkevin/kevin-android/tree/master/demo).

## Building

To build and run project run those commands in terminal:
```
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

## Features

- **Account linking** - we provide an easy solution to authenticate and manage user bank accounts.
- **Bank payments** - we provide a possibility to integrate bank payments in your app with both SCA and non-SCA options.
- **Card payments** - we also provide card payments with a hybrid payment support, so the payment would be performed via bank if we detect that the card belongs to one of our supported banks.

## Documentation

- SDK documentation can be found [here](https://developer.kevin.eu/mobile/)
- The API reference is located [here](https://docs.kevin.eu/)

## Contributing

We welcome contributions of any kind including new features, bug fixes, and documentation improvements. Please first open an issue describing what you want to build if it is a major change so that we can discuss how to move forward. Otherwise, go ahead and open a pull request for minor changes such as typo fixes and one liners.

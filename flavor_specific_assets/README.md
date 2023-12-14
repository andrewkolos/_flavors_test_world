# flavor_specific_assets

This project allows you to play with an upcoming change to allow for the conditional bundling of assets based on the value
provided to `--flavor` (applies to both `flutter run` and `flutter build`). To do this, checkout the [feature branch](https://github.com/andrewkolos/flutter/tree/flavor-specific-assets)
from your local flutter installation.

This project is configured with flavors (see [Create flavors of a Flutter app](https://docs.flutter.dev/deployment/flavors)).
When using `flutter run` or `flutter build` provide `--flavor` to choose which flavor to build with.

See a list of available flavors by running a command with a made-up `--flavor` value. For example, you can run `flutter run --flavor invalid`.

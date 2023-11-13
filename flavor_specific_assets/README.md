# flavor_specific_assets

This project allows you to play with an upcoming change to allow for the conditional bundling of assets based on the value
provided to `--flavor` (applies to both `flutter run` and `flutter build`). To do this, checkout the [feature branch](https://github.com/andrewkolos/flutter/tree/flavor-specific-assets)
from your local flutter installation.

This project is configured with flavors (see [Create flavors of a Flutter app](https://docs.flutter.dev/deployment/flavors)).
When using `flutter run` or `flutter build` provide `--flavor` to choose which flavor to build with.

For Android builds, multidimensional flavors are utilized. Valid `--flavors` include `freeMinApi21`, `freeMinApi23`,
 `premiumMinApi21`, and `premiumMinApi23`.

For iOS builds, `--flavor="free"` can be used.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late final List<String> assets;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  assets = (await AssetManifest.loadFromAssetBundle(rootBundle)).listAssets();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '--flavor',
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontFamily: 'monaco',
                                fontFamilyFallback: ['consolas', 'courier new'],
                                backgroundColor: Color.fromRGBO(0, 0, 0, 0.1),
                              ),
                    ),
                    TextSpan(
                        text: ': $appFlavor',
                        style: Theme.of(context).textTheme.headlineMedium)
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Assets',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              for (final asset in assets) Text('* $asset')
            ],
          ),
        ),
      ),
    );
  }
}

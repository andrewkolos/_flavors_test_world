import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
              future: AssetManifest.loadFromAssetBundle(rootBundle),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final assets = snapshot.data!.listAssets();
                  return MainWidget(assets: assets);
                }
              }),
        ),
      ),
    );
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
    required this.assets,
  });

  final List<String> assets;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '--flavor',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontFamily: 'monaco',
                      fontFamilyFallback: ['consolas', 'courier new'],
                      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.1),
                    ),
              ),
              TextSpan(
                text: ': $appFlavor',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Assets',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        for (final asset in assets) Text('* $asset'),
      ],
    );
  }
}

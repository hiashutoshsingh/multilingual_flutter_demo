import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_secure_storage.dart';
import 'generated/l10n.dart';
import 'screens/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? currentLocale = await AppStorage.appStorage.getValue('locale');
  if (currentLocale != null) {
    if (S.delegate.isSupported(Locale(currentLocale))) {
      S.load(Locale(currentLocale));
    }
  } else {
    String defaultLocale = 'en';
    S.load(Locale(defaultLocale));
    AppStorage.appStorage.setValue('locale', defaultLocale);
  }
  runApp(MyApp(currentLocale: currentLocale!));
}

class MyApp extends StatelessWidget {
  final String currentLocale;

  MyApp({
    required this.currentLocale,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multilingual Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale(currentLocale),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: Home(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:multilingual_demo/app_secure_storage.dart';
import 'package:multilingual_demo/generated/l10n.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).language,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              S.of(context).helloWorld,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 64,
            ),
            ElevatedButton(
              onPressed: () async {
                String? currentLocale = await AppStorage.appStorage.getValue('locale');
                if (currentLocale != null) {
                  String needToSet = (currentLocale == 'hi' ? 'en' : 'hi');
                  if (S.delegate.isSupported(Locale(needToSet))) {
                    S.load(Locale(needToSet));
                    await AppStorage.appStorage.setValue('locale', needToSet);
                    setState(() {});
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  S.of(context).changeLanguage,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

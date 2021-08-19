import 'package:flutter/material.dart';
import 'package:multilingual_demo/generated/l10n.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
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
                onPressed: () {
                  if (S.delegate.isSupported(Locale('hi'))) {
                    S.load(Locale('hi'));
                    setState(() {});
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
      ),
    );
  }
}

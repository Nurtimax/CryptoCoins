import 'package:Nurtimax/routes/routes.dart';
import 'package:Nurtimax/theme/theme.dart';
import 'package:flutter/material.dart';

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nurtimax',
      theme: darkTheme,
      routes: routes,
    );
  }
}

import 'package:get_it/get_it.dart';
import 'package:nurtimax/routes/routes.dart';
import 'package:nurtimax/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'nurtimax',
      theme: darkTheme,
      routes: routes,
      navigatorObservers: [
        TalkerRouteObserver(
          GetIt.I<Talker>(),
        ),
      ],
    );
  }
}

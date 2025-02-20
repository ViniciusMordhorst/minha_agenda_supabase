import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:minha_agenda_supabase/repository/usuario_repository.dart';
import 'package:minha_agenda_supabase/route_generator.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

Future <void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://npoomectmmrmefgmthyb.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5wb29tZWN0bW1ybWVmZ210aHliIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzkyMzE0NjMsImV4cCI6MjA1NDgwNzQ2M30.eyRdsziZc-kS1Ciwo9g9unKgKd5RPaiyRDxgMUOCg4s',


  );

  runApp(MaterialApp(
    localizationsDelegates: [
      GlobalCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      Locale('pt', 'BR'),
    ],
    theme: ThemeData(useMaterial3: true),
    onGenerateRoute: RouteGenerator.generateRoute,
    initialRoute: UsuarioRepository().isLogado() ? "/" : "/login",
    debugShowCheckedModeBanner: false,
  ));
}

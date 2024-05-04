import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_player/controllers/main_screen_notifier.dart';
import 'package:music_player/controllers/permission_controller.dart';
import 'package:provider/provider.dart';
import 'controllers/theme_provider.dart';
import 'screens/main_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainScreenNotifer()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(
          create: (context) => PermissionProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      title: 'Music Player',
      home: Consumer<PermissionProvider>(
        builder: (context, provider, _) {
          if (!provider.isPermissionGranted) {
            provider.requestPermission();
            return Center(
              child: ElevatedButton(
                onPressed: () => Provider.of<PermissionProvider>(context)
                    .requestPermission(),
                child: const Text('Grant Permission'),
              ),
            );
          } else {
            return MainScreen();
          }
        },
      ),
    );
  }
}

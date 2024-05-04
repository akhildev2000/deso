import 'package:flutter/material.dart';
import '../widgets/toggle_switch.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const ToggleSwitch(),
    );
  }
}

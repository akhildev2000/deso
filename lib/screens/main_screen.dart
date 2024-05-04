import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/main_screen_notifier.dart';
import '../widgets/bottom_nav_bar.dart';
import 'home_screen.dart';
import 'library_screen.dart';
import 'search_screen.dart';
import 'settings_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final List<Widget> pageList = [
    const HomeScreen(),
    const SearchScreen(),
    const LibraryScreen(),
    const SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifer>(
      builder: (context, mainScreenNotifer, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: pageList[mainScreenNotifer.pageIndex],
          bottomNavigationBar: const BottomNavBar(),
        );
      },
    );
  }
}

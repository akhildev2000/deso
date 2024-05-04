import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/main_screen_notifier.dart';
import 'button_bottom_nav.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifer>(
      builder: (context, mainScreenNotifer, child) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.6),
                  offset: const Offset(-6.0, -6.0),
                  blurRadius: 16.0,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  offset: const Offset(6.0, 6.0),
                  blurRadius: 16.0,
                ),
              ],
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  16,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNav(
                  icon: mainScreenNotifer.pageIndex == 0
                      ? Icons.home
                      : Icons.home_filled,
                  onTap: () {
                    mainScreenNotifer.pageIndex = 0;
                  },
                ),
                BottomNav(
                  icon: mainScreenNotifer.pageIndex == 1
                      ? Icons.search
                      : Icons.search,
                  onTap: () {
                    mainScreenNotifer.pageIndex = 1;
                  },
                ),
                BottomNav(
                    onTap: () {
                      mainScreenNotifer.pageIndex = 2;
                    },
                    icon: mainScreenNotifer.pageIndex == 2
                        ? Icons.library_add
                        : Icons.library_add_outlined),
                BottomNav(
                  onTap: () {
                    mainScreenNotifer.pageIndex = 3;
                  },
                  icon: mainScreenNotifer.pageIndex == 4
                      ? Icons.settings
                      : Icons.settings,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

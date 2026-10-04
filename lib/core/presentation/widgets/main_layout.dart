import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:animations/animations.dart';

class MainLayout extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  const MainLayout({super.key, required this.navigationShell, required this.children});

  @override
  Widget build(context, ref) {
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 250),
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
          return FadeTransition(
            opacity: primaryAnimation,
            child: child,
          );
        },
        child: children[navigationShell.currentIndex],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.restaurant),
            label: "Przepisy",
          ),
          NavigationDestination(
            icon: Icon(Icons.kitchen), 
            label: "Lodówka",
          ),
        ],
        onDestinationSelected: (int index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}

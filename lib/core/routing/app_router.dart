import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../../features/recipes/presentation/screens/home_screen.dart";
import "routes.dart";

final goRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: Routes.home, builder: (context, state) => const HomeScreen()),
    ]
);
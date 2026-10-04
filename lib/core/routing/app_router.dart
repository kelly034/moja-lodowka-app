import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "../../features/recipes/presentation/screens/home_screen.dart";
import "../../features/recipes/presentation/screens/recipe_details_screen.dart";
import "../../features/recipes/presentation/screens/recipe_home_screen.dart";
import "../../features/recipes/presentation/widgets/animations/recipes_animation.dart";
import "routes.dart";

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.recipes,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.recipes,
              builder: (context, state) => const RecipeHome(),
              routes: [
                GoRoute(
                  path: "${RecipeDetailsScreen.route}/:id",
                  pageBuilder: (context, state) {
                    final id = state.pathParameters["id"]!;
                    return buildSharedAxisPage(
                      state: state,
                      child: RecipeDetailsScreen(id: id),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.fridge,
              builder: (context, state) => const Center(child: Text("lodówka")),
            ),
          ],
        ),
      ],
    ),
  ],
);

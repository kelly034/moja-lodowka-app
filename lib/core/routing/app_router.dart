import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:moja_lodowka_app/features/fridge/presentation/screens/fridge_screen.dart";

import "../presentation/widgets/main_layout.dart";
import "../../features/recipes/presentation/screens/recipe_details_screen.dart";
import "../../features/recipes/presentation/screens/recipe_screen.dart";
import "../../features/recipes/presentation/widgets/animations/recipes_animation.dart";
import "routes.dart";

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.recipes,
  routes: [
    StatefulShellRoute(
      builder: (context, state, navigationShell) {
          return navigationShell;
      },
      navigatorContainerBuilder: (context, navigationShell, children) {
        return MainLayout(
          navigationShell: navigationShell,
          children: children,
        );
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
              builder: (context, state) => FridgeHomeScreen(),
              routes: [
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

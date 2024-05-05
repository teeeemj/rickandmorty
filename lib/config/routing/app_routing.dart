import 'package:go_router/go_router.dart';
import 'package:ricky/presentation/screens/charachters/charachters_page.dart';
import 'package:ricky/presentation/screens/episodes/episodes_page.dart';
import 'package:ricky/presentation/screens/locations/locations_page.dart';
import 'package:ricky/presentation/screens/main_screen.dart';
import 'package:ricky/presentation/screens/settings/settings_page.dart';

final router = GoRouter(
  initialLocation: '/charachters',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/charachters',
              builder: (context, state) => const CharachtersPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/episodes',
              builder: (context, state) => const EpisodesPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/locations',
              builder: (context, state) => const LocationsPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) => const SettingsPage(),
            ),
          ],
        ),
      ],
    )
  ],
);

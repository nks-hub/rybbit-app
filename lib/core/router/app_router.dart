import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/analytics/presentation/analytics_screen.dart';
import '../../features/auth/application/auth_controller.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/errors/presentation/errors_screen.dart';
import '../../features/analytics/presentation/heatmap_screen.dart';
import '../../features/analytics/presentation/journeys_screen.dart';
import '../../features/analytics/presentation/live_view_screen.dart';
import '../../features/analytics/presentation/locations_screen.dart';
import '../../features/analytics/presentation/retention_screen.dart';
import '../../features/events/presentation/event_log_screen.dart';
import '../../features/events/presentation/events_screen.dart';
import '../../features/funnels/presentation/funnels_screen.dart';
import '../../features/goals/presentation/goals_screen.dart';
import '../../features/metrics/presentation/metrics_screen.dart';
import '../../features/organizations/presentation/organizations_screen.dart';
import '../../features/performance/presentation/performance_screen.dart';
import '../../features/session_replay/presentation/replay_detail_screen.dart';
import '../../features/session_replay/presentation/replay_list_screen.dart';
import '../../features/sessions/presentation/session_detail_screen.dart';
import '../../features/sessions/presentation/sessions_list_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/sites/presentation/site_config_screen.dart';
import '../../features/users/presentation/user_detail_screen.dart';
import '../../features/users/presentation/user_traits_screen.dart';
import '../../features/users/presentation/users_screen.dart';
import '../../l10n/app_localizations.dart';
import 'shell_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _dashboardNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'dashboard');
final _analyticsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'analytics');
final _sessionsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sessions');
final _settingsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'settings');

GoRoute _siteRoute(String path, Widget Function(String siteId) builder) {
  return GoRoute(
    path: path,
    builder: (context, state) {
      final siteId = state.pathParameters['siteId']!;
      return builder(siteId);
    },
  );
}

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',
    redirect: (context, state) {
      final isAuthenticated = authState.status == AuthStatus.authenticated;
      final isLoginRoute = state.matchedLocation == '/login';

      if (authState.status == AuthStatus.unknown) return null;

      if (!isAuthenticated && !isLoginRoute) return '/login';
      if (isAuthenticated && isLoginRoute) return '/';

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const LoginScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ShellScreen(navigationShell: navigationShell);
        },
        branches: [
          // Branch 0: Dashboard
          StatefulShellBranch(
            navigatorKey: _dashboardNavigatorKey,
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const DashboardScreen(),
                routes: [
                  GoRoute(
                    path: 'organizations',
                    builder: (context, state) =>
                        const OrganizationsScreen(),
                  ),
                ],
              ),
            ],
          ),

          // Branch 1: Analytics
          StatefulShellBranch(
            navigatorKey: _analyticsNavigatorKey,
            routes: [
              GoRoute(
                path: '/analytics',
                builder: (context, state) {
                  return SiteAwareRoute(
                    tabName: AppLocalizations.of(context)!.analytics,
                    builder: (siteId) => AnalyticsScreen(siteId: siteId),
                  );
                },
                routes: [
                  _siteRoute(':siteId', (siteId) => AnalyticsScreen(siteId: siteId))
                    ..routes.addAll([
                      GoRoute(
                        path: 'metrics/:type',
                        builder: (context, state) {
                          final siteId = state.pathParameters['siteId']!;
                          final type =
                              state.pathParameters['type'] ?? 'pathname';
                          return MetricsScreen(
                              siteId: siteId, metricType: type);
                        },
                      ),
                      _siteRoute('events', (siteId) => EventsScreen(siteId: siteId)),
                      _siteRoute('event-log', (siteId) => EventLogScreen(siteId: siteId)),
                      _siteRoute('heatmap', (siteId) => HeatmapScreen(siteId: siteId)),
                      _siteRoute('live', (siteId) => LiveViewScreen(siteId: siteId)),
                      _siteRoute('retention', (siteId) => RetentionScreen(siteId: siteId)),
                      _siteRoute('journeys', (siteId) => JourneysScreen(siteId: siteId)),
                      _siteRoute('locations', (siteId) => LocationsScreen(siteId: siteId)),
                      _siteRoute('errors', (siteId) => ErrorsScreen(siteId: siteId)),
                      _siteRoute('goals', (siteId) => GoalsScreen(siteId: siteId)),
                      _siteRoute('funnels', (siteId) => FunnelsScreen(siteId: siteId)),
                      _siteRoute('performance', (siteId) => PerformanceScreen(siteId: siteId)),
                      _siteRoute('users', (siteId) => UsersScreen(siteId: siteId)),
                      _siteRoute('user-traits', (siteId) => UserTraitsScreen(siteId: siteId)),
                      GoRoute(
                        path: 'users/:userId',
                        builder: (context, state) {
                          final siteId = state.pathParameters['siteId']!;
                          final userId = Uri.decodeComponent(
                              state.pathParameters['userId']!);
                          return UserDetailScreen(
                              siteId: siteId, userId: userId);
                        },
                      ),
                      _siteRoute('config', (siteId) => SiteConfigScreen(siteId: siteId)),
                      _siteRoute('replay', (siteId) => ReplayListScreen(siteId: siteId)),
                      GoRoute(
                        path: 'replay/:sessionId',
                        builder: (context, state) {
                          final siteId = state.pathParameters['siteId']!;
                          final sessionId =
                              state.pathParameters['sessionId']!;
                          return ReplayDetailScreen(
                            siteId: siteId,
                            sessionId: sessionId,
                          );
                        },
                      ),
                      _siteRoute('sessions', (siteId) => SessionsListScreen(siteId: siteId)),
                      GoRoute(
                        path: 'sessions/:sessionId',
                        builder: (context, state) {
                          final siteId = state.pathParameters['siteId']!;
                          final sessionId =
                              state.pathParameters['sessionId']!;
                          return SessionDetailScreen(
                            siteId: siteId,
                            sessionId: sessionId,
                          );
                        },
                      ),
                    ]),
                ],
              ),
            ],
          ),

          // Branch 2: Sessions
          StatefulShellBranch(
            navigatorKey: _sessionsNavigatorKey,
            routes: [
              GoRoute(
                path: '/sessions',
                builder: (context, state) {
                  return SiteAwareRoute(
                    tabName: AppLocalizations.of(context)!.sessions,
                    builder: (siteId) => SessionsListScreen(siteId: siteId),
                  );
                },
                routes: [
                  _siteRoute(':siteId', (siteId) => SessionsListScreen(siteId: siteId))
                    ..routes.addAll([
                      GoRoute(
                        path: ':sessionId',
                        builder: (context, state) {
                          final siteId = state.pathParameters['siteId']!;
                          final sessionId =
                              state.pathParameters['sessionId']!;
                          return SessionDetailScreen(
                            siteId: siteId,
                            sessionId: sessionId,
                          );
                        },
                      ),
                    ]),
                ],
              ),
            ],
          ),

          // Branch 3: Settings
          StatefulShellBranch(
            navigatorKey: _settingsNavigatorKey,
            routes: [
              GoRoute(
                path: '/settings',
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

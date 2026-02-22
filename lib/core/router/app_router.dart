import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';

import '../../features/analytics/presentation/analytics_screen.dart';
import '../../features/auth/application/auth_controller.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/errors/presentation/errors_screen.dart';
import '../../features/events/presentation/events_screen.dart';
import '../../features/funnels/presentation/funnels_screen.dart';
import '../../features/goals/presentation/goals_screen.dart';
import '../../features/metrics/presentation/metrics_screen.dart';
import '../../features/organizations/presentation/organizations_screen.dart';
import '../../features/performance/presentation/performance_screen.dart';
import '../../features/sessions/presentation/session_detail_screen.dart';
import '../../features/sessions/presentation/sessions_list_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/sites/presentation/site_config_screen.dart';
import '../../features/users/presentation/user_detail_screen.dart';
import '../../features/users/presentation/users_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
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
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/organizations',
        builder: (context, state) => const OrganizationsScreen(),
      ),
      GoRoute(
        path: '/sites/:siteId',
        builder: (context, state) {
          final siteId = state.pathParameters['siteId']!;
          return AnalyticsScreen(siteId: siteId);
        },
      ),
      GoRoute(
        path: '/sites/:siteId/metrics/:type',
        builder: (context, state) {
          final siteId = state.pathParameters['siteId']!;
          final type = state.pathParameters['type'] ?? 'pathname';
          return MetricsScreen(siteId: siteId, metricType: type);
        },
      ),
      GoRoute(
        path: '/sites/:siteId/sessions',
        builder: (context, state) {
          final siteId = state.pathParameters['siteId']!;
          return SessionsListScreen(siteId: siteId);
        },
      ),
      GoRoute(
        path: '/sites/:siteId/sessions/:sessionId',
        builder: (context, state) {
          final siteId = state.pathParameters['siteId']!;
          final sessionId = state.pathParameters['sessionId']!;
          return SessionDetailScreen(siteId: siteId, sessionId: sessionId);
        },
      ),
      GoRoute(
        path: '/sites/:siteId/events',
        builder: (context, state) {
          final siteId = state.pathParameters['siteId']!;
          return EventsScreen(siteId: siteId);
        },
      ),
      GoRoute(
        path: '/sites/:siteId/errors',
        builder: (context, state) {
          final siteId = state.pathParameters['siteId']!;
          return ErrorsScreen(siteId: siteId);
        },
      ),
      GoRoute(
        path: '/sites/:siteId/goals',
        builder: (context, state) {
          final siteId = state.pathParameters['siteId']!;
          return GoalsScreen(siteId: siteId);
        },
      ),
      GoRoute(
        path: '/sites/:siteId/funnels',
        builder: (context, state) {
          final siteId = state.pathParameters['siteId']!;
          return FunnelsScreen(siteId: siteId);
        },
      ),
      GoRoute(
        path: '/sites/:siteId/performance',
        builder: (context, state) {
          final siteId = state.pathParameters['siteId']!;
          return PerformanceScreen(siteId: siteId);
        },
      ),
      GoRoute(
        path: '/sites/:siteId/users',
        builder: (context, state) {
          final siteId = state.pathParameters['siteId']!;
          return UsersScreen(siteId: siteId);
        },
      ),
      GoRoute(
        path: '/sites/:siteId/users/:userId',
        builder: (context, state) {
          final siteId = state.pathParameters['siteId']!;
          final userId = Uri.decodeComponent(
              state.pathParameters['userId']!);
          return UserDetailScreen(siteId: siteId, userId: userId);
        },
      ),
      GoRoute(
        path: '/sites/:siteId/config',
        builder: (context, state) {
          final siteId = state.pathParameters['siteId']!;
          return SiteConfigScreen(siteId: siteId);
        },
      ),
    ],
  );
});

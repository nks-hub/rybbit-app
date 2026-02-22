import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';

import '../../features/analytics/presentation/analytics_screen.dart';
import '../../features/auth/application/auth_controller.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/errors/presentation/errors_screen.dart';
import '../../features/events/presentation/events_screen.dart';
import '../../features/metrics/presentation/metrics_screen.dart';
import '../../features/sessions/presentation/session_detail_screen.dart';
import '../../features/sessions/presentation/sessions_list_screen.dart';

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
    ],
  );
});

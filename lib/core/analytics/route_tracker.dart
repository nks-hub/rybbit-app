import 'package:go_router/go_router.dart';
import 'package:rybbit_flutter_sdk/rybbit_flutter_sdk.dart';

/// Reports screen views to Rybbit whenever the router settles on a new route.
///
/// The SDK ships a [RybbitNavigatorObserver], but it reads `route.settings
/// .name`, which go_router fills with the *relative* sub-path — several
/// branches would collapse into an ambiguous `analytics` or `sessions`. The
/// router's own `fullPath` is unambiguous and, being the route pattern rather
/// than the resolved location, keeps the user's site ids out of the payload:
/// `/site/:siteId/analytics`, never `/site/42/analytics`.
void trackRouteChanges(GoRouter router) {
  String? lastPath;

  void report() {
    // `state` throws while the delegate holds no match — during the very first
    // resolution and again whenever a redirect empties the match list.
    final String? path;
    try {
      path = router.state.fullPath;
    } catch (_) {
      return;
    }
    // go_router notifies on every rebuild, not just navigation.
    if (path == null || path.isEmpty || path == lastPath) return;
    lastPath = path;
    if (!Rybbit.isInitialized) return;
    Rybbit.instance.screenView(path);
  }

  router.routerDelegate.addListener(report);
}

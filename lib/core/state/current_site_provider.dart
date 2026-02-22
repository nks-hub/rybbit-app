import 'package:riverpod/riverpod.dart';

/// Holds the currently selected site ID.
/// Set when user taps a site on the dashboard.
/// Used by analytics/sessions tabs to know which site to show.
final currentSiteIdProvider = StateProvider<String?>((ref) => null);

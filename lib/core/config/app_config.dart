import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppConfig {
  final String serverUrl;
  final String? apiKey;

  const AppConfig({
    this.serverUrl = '',
    this.apiKey,
  });

  AppConfig copyWith({
    String? serverUrl,
    String? apiKey,
  }) {
    return AppConfig(
      serverUrl: serverUrl ?? this.serverUrl,
      apiKey: apiKey ?? this.apiKey,
    );
  }

  String get baseUrl {
    if (serverUrl.isEmpty) return '';
    final url = serverUrl.endsWith('/')
        ? serverUrl.substring(0, serverUrl.length - 1)
        : serverUrl;
    return url;
  }

  bool get isConfigured => serverUrl.isNotEmpty;
  bool get hasApiKey => apiKey != null && apiKey!.isNotEmpty;
}

class AppConfigNotifier extends Notifier<AppConfig> {
  @override
  AppConfig build() => const AppConfig();

  void setServerUrl(String url) {
    state = state.copyWith(serverUrl: url);
  }

  void setApiKey(String? key) {
    state = state.copyWith(apiKey: key);
  }

  void setConfig({required String serverUrl, String? apiKey}) {
    state = AppConfig(serverUrl: serverUrl, apiKey: apiKey);
  }

  void clear() {
    state = const AppConfig();
  }
}

final appConfigNotifierProvider =
    NotifierProvider<AppConfigNotifier, AppConfig>(AppConfigNotifier.new);

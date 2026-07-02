import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/storage/storage_service.dart';
import '../../../l10n/app_localizations.dart';
import '../application/auth_controller.dart';

enum LoginMode { email, apiKey }

enum ConnectionTarget { cloud, selfHosted }

/// Fixed server URL of the hosted Rybbit Cloud. On cloud, email/password login
/// is CAPTCHA-gated, so the app connects via an API key instead.
const _cloudServerUrl = 'https://app.rybbit.io';
const _cloudApiKeyUrl = 'https://app.rybbit.io/settings/account';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _serverUrlController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _apiKeyController = TextEditingController();
  var _loginMode = LoginMode.email;
  var _target = ConnectionTarget.selfHosted;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    final storage = ref.read(storageServiceProvider);
    final savedUrl = await storage.readSecure('server_url');
    if (savedUrl != null && savedUrl.isNotEmpty && mounted) {
      _serverUrlController.text = savedUrl;
      if (savedUrl.trim().replaceAll(RegExp(r'/+$'), '') == _cloudServerUrl) {
        setState(() {
          _target = ConnectionTarget.cloud;
          _loginMode = LoginMode.apiKey;
        });
      }
    }
    final savedEmail = await storage.readSecure('last_email');
    if (savedEmail != null && savedEmail.isNotEmpty && mounted) {
      _emailController.text = savedEmail;
    }
  }

  void _selectTarget(ConnectionTarget target) {
    setState(() {
      _target = target;
      // Cloud only supports API-key auth (password login is CAPTCHA-gated).
      if (target == ConnectionTarget.cloud) {
        _loginMode = LoginMode.apiKey;
      }
    });
  }

  Future<void> _openCloudApiKeys() async {
    await launchUrl(
      Uri.parse(_cloudApiKeyUrl),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  void dispose() {
    _serverUrlController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _apiKeyController.dispose();
    super.dispose();
  }

  Future<void> _connect() async {
    if (!_formKey.currentState!.validate()) return;

    final serverUrl = _target == ConnectionTarget.cloud
        ? _cloudServerUrl
        : _serverUrlController.text.trim();
    final controller = ref.read(authControllerProvider.notifier);

    if (_loginMode == LoginMode.email) {
      final email = _emailController.text.trim();
      final password = _passwordController.text;
      await controller.login(serverUrl, email, password);
    } else {
      final apiKey = _apiKeyController.text.trim();
      await controller.loginWithApiKey(serverUrl, apiKey);
    }

    TextInput.finishAutofillContext();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: AutofillGroup(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      'assets/rybbit_horizontal_white.png',
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.appSubtitle,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),
                    SegmentedButton<ConnectionTarget>(
                      segments: [
                        ButtonSegment(
                          value: ConnectionTarget.cloud,
                          label: Text(l10n.connectionCloud),
                          icon: const Icon(Icons.cloud_outlined),
                        ),
                        ButtonSegment(
                          value: ConnectionTarget.selfHosted,
                          label: Text(l10n.connectionSelfHosted),
                          icon: const Icon(Icons.dns_outlined),
                        ),
                      ],
                      selected: {_target},
                      onSelectionChanged: (selection) =>
                          _selectTarget(selection.first),
                    ),
                    const SizedBox(height: 24),
                    if (_target == ConnectionTarget.cloud) ...[
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color:
                                theme.colorScheme.primary.withValues(alpha: 0.25),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.cloudApiKeyInfo,
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(fontSize: 12.5, height: 1.35),
                            ),
                            const SizedBox(height: 8),
                            InkWell(
                              onTap: _openCloudApiKeys,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.open_in_new,
                                      size: 15, color: theme.colorScheme.primary),
                                  const SizedBox(width: 6),
                                  Flexible(
                                    child: Text(
                                      l10n.cloudCreateApiKey,
                                      style: TextStyle(
                                        color: theme.colorScheme.primary,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ] else ...[
                      TextFormField(
                        controller: _serverUrlController,
                        decoration: InputDecoration(
                          labelText: l10n.serverUrl,
                          hintText: l10n.serverUrlHint,
                          prefixIcon: const Icon(Icons.dns_outlined),
                        ),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (_target == ConnectionTarget.cloud) return null;
                          if (value == null || value.trim().isEmpty) {
                            return l10n.serverUrl;
                          }
                          final url = value.trim();
                          final uri = Uri.tryParse(url);
                          if (uri == null ||
                              !uri.hasScheme ||
                              !uri.isAbsolute ||
                              (uri.scheme != 'http' && uri.scheme != 'https') ||
                              uri.host.isEmpty ||
                              uri.host.contains(',') ||
                              uri.host.contains(' ')) {
                            return l10n.invalidUrl;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      SegmentedButton<LoginMode>(
                        segments: [
                          ButtonSegment(
                            value: LoginMode.email,
                            label: Text(l10n.email),
                            icon: const Icon(Icons.email_outlined),
                          ),
                          ButtonSegment(
                            value: LoginMode.apiKey,
                            label: Text(l10n.apiKey),
                            icon: const Icon(Icons.key_outlined),
                          ),
                        ],
                        selected: {_loginMode},
                        onSelectionChanged: (selection) {
                          setState(() {
                            _loginMode = selection.first;
                          });
                        },
                      ),
                      const SizedBox(height: 24),
                    ],
                    if (_loginMode == LoginMode.email) ...[
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        autofillHints: const [
                          AutofillHints.email,
                          AutofillHints.username,
                        ],
                        decoration: InputDecoration(
                          labelText: l10n.email,
                          prefixIcon: const Icon(Icons.person_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return l10n.email;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        textInputAction: TextInputAction.done,
                        autofillHints: const [AutofillHints.password],
                        onFieldSubmitted: (_) => _connect(),
                        decoration: InputDecoration(
                          labelText: l10n.password,
                          prefixIcon: const Icon(Icons.lock_outlined),
                          suffixIcon: IconButton(
                            tooltip: _obscurePassword
                                ? l10n.showPassword
                                : l10n.hidePassword,
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return l10n.password;
                          }
                          return null;
                        },
                      ),
                    ] else ...[
                      TextFormField(
                        controller: _apiKeyController,
                        textInputAction: TextInputAction.done,
                        autofillHints: const [AutofillHints.password],
                        onFieldSubmitted: (_) => _connect(),
                        decoration: InputDecoration(
                          labelText: l10n.apiKey,
                          prefixIcon: const Icon(Icons.vpn_key_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return l10n.apiKey;
                          }
                          return null;
                        },
                      ),
                    ],
                    const SizedBox(height: 8),
                    if (authState.error != null) ...[
                      const SizedBox(height: 8),
                      Semantics(
                        liveRegion: true,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color:
                                theme.colorScheme.error.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: theme.colorScheme.error
                                  .withValues(alpha: 0.3),
                            ),
                          ),
                          child: Text(
                            _localizeError(authState.error!, l10n),
                            style: TextStyle(
                              color: theme.colorScheme.error,
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: authState.isLoading ? null : _connect,
                        child: authState.isLoading
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                              )
                            : Text(
                                l10n.connect,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _localizeError(String error, AppLocalizations l10n) {
    if (error.startsWith(AuthController.rateLimitedErrorPrefix)) {
      final seconds =
          error.substring(AuthController.rateLimitedErrorPrefix.length);
      return l10n.loginRateLimited(seconds);
    }
    switch (error) {
      case AuthController.connectionFailedError:
        return l10n.connectionFailed;
      case AuthController.invalidApiKeyError:
        return l10n.invalidApiKey;
      case AuthController.connectionFailedApiKeyError:
        return l10n.connectionFailedApiKey;
      case AuthController.unexpectedError:
        return l10n.unexpectedError;
      default:
        return l10n.unexpectedError;
    }
  }
}

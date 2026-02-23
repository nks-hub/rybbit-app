import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../utils/formatters.dart';

class ErrorView extends StatelessWidget {
  final String? message;
  final String? detail;
  final VoidCallback? onRetry;

  const ErrorView({
    super.key,
    this.message,
    this.detail,
    this.onRetry,
  });

  factory ErrorView.fromError(Object error, {VoidCallback? onRetry}) {
    return ErrorView(
      detail: formatError(error),
      onRetry: onRetry,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final displayMessage = message ?? l10n.failedToLoadGeneric;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              displayMessage,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            if (detail != null) ...[
              const SizedBox(height: 8),
              Text(
                detail!,
                style: theme.textTheme.bodySmall,
                textAlign: TextAlign.center,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onRetry,
                child: Text(l10n.retry),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

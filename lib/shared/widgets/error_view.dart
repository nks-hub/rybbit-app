import 'package:flutter/material.dart';

/// Generic error widget for displaying error states consistently.
/// Suitable for use within AsyncValue.error handlers.
class ErrorView extends StatelessWidget {
  final String message;
  final String? detail;
  final VoidCallback? onRetry;

  const ErrorView({
    super.key,
    this.message = 'Something went wrong',
    this.detail,
    this.onRetry,
  });

  /// Convenience constructor from an error object.
  factory ErrorView.fromError(Object error, {VoidCallback? onRetry}) {
    return ErrorView(
      message: 'An error occurred',
      detail: error.toString(),
      onRetry: onRetry,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
              message,
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
                child: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

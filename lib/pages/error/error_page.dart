import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorNotFound extends StatelessWidget {
  const ErrorNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Text(
          AppLocalizations.of(context)!.txt_error_404,
          style: theme.textTheme.displaySmall,
        ),
      ),
    );
  }
}

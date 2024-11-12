import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_lowcode_plateform/pages/editor/page_editor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart' as provider;
import 'package:vrouter/vrouter.dart';

import 'pages/index.dart';
import 'theme/app_theme.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

void main() {
  GoogleFonts.config.allowRuntimeFetching = true;
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetFactory.ensureInitialized();

  runApp(
    provider.ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const riverpod.ProviderScope(child: FlutterDesignerApp()),
    ),
  );
}

class FlutterDesignerApp extends StatefulWidget {
  const FlutterDesignerApp({super.key});

  @override
  State<FlutterDesignerApp> createState() => _FlutterDesignerAppState();
}

class _FlutterDesignerAppState extends State<FlutterDesignerApp> {
  final _locale = const Locale('en');

  @override
  Widget build(BuildContext context) {
    return provider.Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return VRouter(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
              themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: _locale,
          // This transition will be applied to every route
          buildTransition: (animation1, _, child) {
            return FadeTransition(opacity: animation1, child: child);
          },
          routes: [
            VWidget(
              path: '/',
              widget: const HomePage(),
              stackedRoutes: [
                VWidget(path: '/editor/:appID', widget: const PageEditor()),
              ],
            ),
          ],
        );
      },
    );
  }
}

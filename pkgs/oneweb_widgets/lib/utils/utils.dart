import 'package:flutter/material.dart';
import 'package:render_engine/main.dart';

void setDarkModeSetting(BuildContext context, ThemeMode themeMode) =>
    MyApp.of(context).setThemeMode(themeMode);

final RouteObserver<ModalRoute> routeObserver = RouteObserver<PageRoute>();

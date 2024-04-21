import 'package:flutter/material.dart';
import 'package:neo_tour/config/theme/app_theme.dart';
import 'package:neo_tour/presentation/pages/onboarding.dart';

void main() => runApp(
      MaterialApp(
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        home: const Onboarding(),
      ),
    );

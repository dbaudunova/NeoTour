import 'package:flutter/material.dart';
import 'package:neo_tour/internal/di.dart';
import 'package:neo_tour/internal/my_app.dart';

void main() {
  initDependencies();
  runApp(const MyApp());
}

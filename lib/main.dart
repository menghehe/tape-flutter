import 'package:flutter/material.dart';
import 'package:tape/app.dart';
import 'main.reflectable.dart' show initializeReflectable;


void main() {
  initializeReflectable();
  runApp(createApp());
}
import 'package:deep_byte_assessment/screens/deep_byte_app_screen.dart';
import 'package:deep_byte_assessment/utils/app_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme(),
        home: const DeepByteAssessmentApp(),
      ),
    );
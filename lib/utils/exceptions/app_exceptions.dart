import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

/// isInDebugMode  is a function that provides a bool indicating whether in
/// the flutter build mode of debug or not.
/// @author Fredrick Allan Grott
bool get isInDebugMode {
  bool _inDebugMode = false;

  // ignore: prefer-conditional-expressions
  if (kDebugMode) {
    _inDebugMode = false;
  } else {
    _inDebugMode = true;
  }

  return _inDebugMode;
}

/// isInReleaseMode  is a function that provides a bool indicating whether in
/// the flutter build mode of debug or not.
/// @author Fredrick Allan Grott
bool get isInReleaseMode {
  bool _inReleaseMode = false;

  // ignore: prefer-conditional-expressions
  if (kReleaseMode) {
    _inReleaseMode = true;
  } else {
    _inReleaseMode = false;
  }

  return _inReleaseMode;
}

/// isInProfileMode  is a function that provides a bool indicating whether in
/// the flutter build mode of debug or not.
/// @author Fredrick Allan Grott
bool get isInProfileMode {
  bool _inProfileMode = false;

  // ignore: prefer-conditional-expressions
  if (kProfileMode) {
    _inProfileMode = true;
  } else {
    _inProfileMode = false;
  }

  return _inProfileMode;
}
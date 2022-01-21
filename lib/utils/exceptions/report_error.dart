

import 'dart:developer';

import 'app_exceptions.dart';

Future<void> _reportError(dynamic error, dynamic stackTrace) async {
  log('Caught error: $error');
  // Errors thrown in development mode are unlikely to be interesting. You
  // check if you are running in dev mode using an assertion and omit send
  // the report.
  if (isInDebugMode) {
    log('$stackTrace');
    log('In dev mode. Not sending report to an app exceptions provider.');
    return;
  } else {
    // reporting error and stacktrace to app exceptions provider code goes here
    if (isInReleaseMode) {
      // code goes here
    }
  }
}
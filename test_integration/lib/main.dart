import 'dart:async';

import 'package:ably_flutter_integration_test/config/test_factory.dart';
import 'package:ably_flutter_integration_test/test_dispatcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() {
  final testDispatcherController = DispatcherController();

  // track FlutterError's
  FlutterError.onError = testDispatcherController.logFlutterErrors;

  // enable driver extension
  enableFlutterDriverExtension(handler: testDispatcherController.driveHandler);

  runZoned(
    () => runApp(
      TestDispatcher(
        testFactory: testFactory,
        controller: testDispatcherController,
      ),
    ),
  );
}

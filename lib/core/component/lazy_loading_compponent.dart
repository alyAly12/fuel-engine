import 'dart:async';
import 'package:flutter/material.dart';

final dialogContextCompleter = Completer<BuildContext>();

void lazyLoadingComponent(BuildContext context, Widget child) async {
  showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext dialogContext) {
      if (!dialogContextCompleter.isCompleted) {
        dialogContextCompleter.complete(dialogContext);
      }
      return Center(child: child);
    },
  );
}

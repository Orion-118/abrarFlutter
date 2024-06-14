import 'dart:ui';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

//content types are = help, failure, success, warning
//for SnackBar, it comes from bottom
SnackBar createSnackBar(
    {required String title,
    required String message,
    required String contentType}) {
  return SnackBar(
    elevation: 0,
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      contentType: returnContentType(contentType),
    ),
  );
}

ContentType returnContentType(String contentType) {
  switch (contentType) {
    case "help":
      return ContentType.help;
    case "failure":
      return ContentType.failure;
    case "success":
      return ContentType.success;
    case "warning":
      return ContentType.warning;
    default:
      return ContentType.help;
  }
}

//this is the alert popup
//QuickAlert types are = info, error, success, warning, confirm, loading, custom
Future createQuickAlert(
    {required BuildContext context,
    required String title,
    required String message,
    required String type}) {
  return QuickAlert.show(
    context: context,
    type: _returnQuickAlertType(type),
    title: title,
    text: message,
    customAsset: returnCustomAsset(type),
  );
}

//confirm quick alert
Future createQuickAlertConfirm(
    {required BuildContext context,
    required String title,
    required String message,
    required String type,
    required VoidCallback onConfirmBtnTap,
    required VoidCallback onCancelBtnTap}) {
  return QuickAlert.show(
    context: context,
    type: QuickAlertType.confirm,
    title: title,
    text: message,
    customAsset: "lib/assets/images/confirm.gif",
    backgroundColor: Theme.of(context).colorScheme.surfaceDim,
    textColor: Theme.of(context).colorScheme.onSurface,
    titleColor: Theme.of(context).colorScheme.onSurface,
    confirmBtnText: "Yes",
    cancelBtnText: "No",
    onConfirmBtnTap: onConfirmBtnTap,
    onCancelBtnTap: onCancelBtnTap,
  );
}

String returnCustomAsset(String type) {
  switch (type) {
    case "info":
      return "lib/assets/images/info.gif";
    case "error":
      return "lib/assets/images/error.gif";
    case "success":
      return "lib/assets/images/success.gif";
    case "warning":
      return "lib/assets/images/warning.gif";
    case "confirm":
      return "lib/assets/images/confirm.gif";
    case "loading":
      return "lib/assets/images/loading.gif";
    case "custom":
      return "lib/assets/images/custom.gif";
    default:
      return "lib/assets/images/info.gif";
  }
}

QuickAlertType _returnQuickAlertType(String type) {
  switch (type) {
    case "info":
      return QuickAlertType.info;
    case "error":
      return QuickAlertType.error;
    case "success":
      return QuickAlertType.success;
    case "warning":
      return QuickAlertType.warning;
    case "confirm":
      return QuickAlertType.confirm;
    case "loading":
      return QuickAlertType.loading;
    case "custom":
      return QuickAlertType.custom;
    default:
      return QuickAlertType.info;
  }
}

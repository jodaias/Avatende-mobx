import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
part 'notification_store.g.dart';

class NotificationStore = _NotificationBaseStore with _$NotificationStore;

abstract class _NotificationBaseStore with Store {
  @observable
  String message = "";

  @action
  void setMessage(String value) => message = value;

  @action
  void showMessage(
      {required Color? textColor,
      required Color? backgroundColor,
      String? msg,
      double? fontSize = 16.0,
      ToastGravity gravity = ToastGravity.TOP}) {
    if (message.isEmpty && (msg == null || msg.isEmpty)) return;

    if (msg != null && msg.isNotEmpty) message = msg;

    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: gravity,
        timeInSecForIosWeb: 5,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize);
  }
}

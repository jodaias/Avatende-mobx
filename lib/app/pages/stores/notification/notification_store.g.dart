// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotificationStore on _NotificationBaseStore, Store {
  late final _$messageAtom =
      Atom(name: '_NotificationBaseStore.message', context: context);

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$_NotificationBaseStoreActionController =
      ActionController(name: '_NotificationBaseStore', context: context);

  @override
  void setMessage(String value) {
    final _$actionInfo = _$_NotificationBaseStoreActionController.startAction(
        name: '_NotificationBaseStore.setMessage');
    try {
      return super.setMessage(value);
    } finally {
      _$_NotificationBaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showMessage(
      {required Color? textColor,
      required Color? backgroundColor,
      String? msg,
      double? fontSize = 16.0,
      ToastGravity gravity = ToastGravity.TOP}) {
    final _$actionInfo = _$_NotificationBaseStoreActionController.startAction(
        name: '_NotificationBaseStore.showMessage');
    try {
      return super.showMessage(
          textColor: textColor,
          backgroundColor: backgroundColor,
          msg: msg,
          fontSize: fontSize,
          gravity: gravity);
    } finally {
      _$_NotificationBaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
message: ${message}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avaliation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AvaliationStore on _AvaliationStoreBase, Store {
  Computed<bool> _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_AvaliationStoreBase.emailValid'))
          .value;
  Computed<bool> _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: '_AvaliationStoreBase.phoneValid'))
          .value;
  Computed<Function> _$sendPressedComputed;

  @override
  Function get sendPressed =>
      (_$sendPressedComputed ??= Computed<Function>(() => super.sendPressed,
              name: '_AvaliationStoreBase.sendPressed'))
          .value;

  final _$scoresAtom = Atom(name: '_AvaliationStoreBase.scores');

  @override
  double get scores {
    _$scoresAtom.reportRead();
    return super.scores;
  }

  @override
  set scores(double value) {
    _$scoresAtom.reportWrite(value, super.scores, () {
      super.scores = value;
    });
  }

  final _$observationAtom = Atom(name: '_AvaliationStoreBase.observation');

  @override
  String get observation {
    _$observationAtom.reportRead();
    return super.observation;
  }

  @override
  set observation(String value) {
    _$observationAtom.reportWrite(value, super.observation, () {
      super.observation = value;
    });
  }

  final _$emailAtom = Atom(name: '_AvaliationStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$phoneAtom = Atom(name: '_AvaliationStoreBase.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$loadingAtom = Atom(name: '_AvaliationStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$anonymousAtom = Atom(name: '_AvaliationStoreBase.anonymous');

  @override
  bool get anonymous {
    _$anonymousAtom.reportRead();
    return super.anonymous;
  }

  @override
  set anonymous(bool value) {
    _$anonymousAtom.reportWrite(value, super.anonymous, () {
      super.anonymous = value;
    });
  }

  final _$avaliationSuccessAtom =
      Atom(name: '_AvaliationStoreBase.avaliationSuccess');

  @override
  bool get avaliationSuccess {
    _$avaliationSuccessAtom.reportRead();
    return super.avaliationSuccess;
  }

  @override
  set avaliationSuccess(bool value) {
    _$avaliationSuccessAtom.reportWrite(value, super.avaliationSuccess, () {
      super.avaliationSuccess = value;
    });
  }

  final _$sendAvaliationAsyncAction =
      AsyncAction('_AvaliationStoreBase.sendAvaliation');

  @override
  Future<void> sendAvaliation() {
    return _$sendAvaliationAsyncAction.run(() => super.sendAvaliation());
  }

  final _$_AvaliationStoreBaseActionController =
      ActionController(name: '_AvaliationStoreBase');

  @override
  void setScores(double value) {
    final _$actionInfo = _$_AvaliationStoreBaseActionController.startAction(
        name: '_AvaliationStoreBase.setScores');
    try {
      return super.setScores(value);
    } finally {
      _$_AvaliationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservation(String value) {
    final _$actionInfo = _$_AvaliationStoreBaseActionController.startAction(
        name: '_AvaliationStoreBase.setObservation');
    try {
      return super.setObservation(value);
    } finally {
      _$_AvaliationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_AvaliationStoreBaseActionController.startAction(
        name: '_AvaliationStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_AvaliationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_AvaliationStoreBaseActionController.startAction(
        name: '_AvaliationStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_AvaliationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAnonymous(bool value) {
    final _$actionInfo = _$_AvaliationStoreBaseActionController.startAction(
        name: '_AvaliationStoreBase.setAnonymous');
    try {
      return super.setAnonymous(value);
    } finally {
      _$_AvaliationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scores: ${scores},
observation: ${observation},
email: ${email},
phone: ${phone},
loading: ${loading},
anonymous: ${anonymous},
avaliationSuccess: ${avaliationSuccess},
emailValid: ${emailValid},
phoneValid: ${phoneValid},
sendPressed: ${sendPressed}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avaliation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AvaliationStore on _AvaliationStoreBase, Store {
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_AvaliationStoreBase.emailValid'))
          .value;
  Computed<VoidCallback?>? _$sendPressedComputed;

  @override
  VoidCallback? get sendPressed => (_$sendPressedComputed ??=
          Computed<VoidCallback?>(() => super.sendPressed,
              name: '_AvaliationStoreBase.sendPressed'))
      .value;
  Computed<dynamic>? _$listAdsImagesComputed;

  @override
  dynamic get listAdsImages =>
      (_$listAdsImagesComputed ??= Computed<dynamic>(() => super.listAdsImages,
              name: '_AvaliationStoreBase.listAdsImages'))
          .value;

  late final _$scoresAtom =
      Atom(name: '_AvaliationStoreBase.scores', context: context);

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

  late final _$observationAtom =
      Atom(name: '_AvaliationStoreBase.observation', context: context);

  @override
  String? get observation {
    _$observationAtom.reportRead();
    return super.observation;
  }

  @override
  set observation(String? value) {
    _$observationAtom.reportWrite(value, super.observation, () {
      super.observation = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_AvaliationStoreBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$companyIdAtom =
      Atom(name: '_AvaliationStoreBase.companyId', context: context);

  @override
  String? get companyId {
    _$companyIdAtom.reportRead();
    return super.companyId;
  }

  @override
  set companyId(String? value) {
    _$companyIdAtom.reportWrite(value, super.companyId, () {
      super.companyId = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_AvaliationStoreBase.loading', context: context);

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

  late final _$anonymousAtom =
      Atom(name: '_AvaliationStoreBase.anonymous', context: context);

  @override
  bool? get anonymous {
    _$anonymousAtom.reportRead();
    return super.anonymous;
  }

  @override
  set anonymous(bool? value) {
    _$anonymousAtom.reportWrite(value, super.anonymous, () {
      super.anonymous = value;
    });
  }

  late final _$avaliationSuccessAtom =
      Atom(name: '_AvaliationStoreBase.avaliationSuccess', context: context);

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

  late final _$sendAvaliationAsyncAction =
      AsyncAction('_AvaliationStoreBase.sendAvaliation', context: context);

  @override
  Future<void> sendAvaliation() {
    return _$sendAvaliationAsyncAction.run(() => super.sendAvaliation());
  }

  late final _$_AvaliationStoreBaseActionController =
      ActionController(name: '_AvaliationStoreBase', context: context);

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
  void setObservation(String? value) {
    final _$actionInfo = _$_AvaliationStoreBaseActionController.startAction(
        name: '_AvaliationStoreBase.setObservation');
    try {
      return super.setObservation(value);
    } finally {
      _$_AvaliationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String? value) {
    final _$actionInfo = _$_AvaliationStoreBaseActionController.startAction(
        name: '_AvaliationStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_AvaliationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAnonymous(bool? value) {
    final _$actionInfo = _$_AvaliationStoreBaseActionController.startAction(
        name: '_AvaliationStoreBase.setAnonymous');
    try {
      return super.setAnonymous(value);
    } finally {
      _$_AvaliationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCompanyId(String? value) {
    final _$actionInfo = _$_AvaliationStoreBaseActionController.startAction(
        name: '_AvaliationStoreBase.setCompanyId');
    try {
      return super.setCompanyId(value);
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
companyId: ${companyId},
loading: ${loading},
anonymous: ${anonymous},
avaliationSuccess: ${avaliationSuccess},
emailValid: ${emailValid},
sendPressed: ${sendPressed},
listAdsImages: ${listAdsImages}
    ''';
  }
}

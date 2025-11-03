// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voluntario_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VoluntarioStore on _VoluntarioStoreBase, Store {
  late final _$voluntarioAtom =
      Atom(name: '_VoluntarioStoreBase.voluntario', context: context);

  @override
  Voluntario? get voluntario {
    _$voluntarioAtom.reportRead();
    return super.voluntario;
  }

  @override
  set voluntario(Voluntario? value) {
    _$voluntarioAtom.reportWrite(value, super.voluntario, () {
      super.voluntario = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_VoluntarioStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_VoluntarioStoreBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$loadVoluntarioAsyncAction =
      AsyncAction('_VoluntarioStoreBase.loadVoluntario', context: context);

  @override
  Future<void> loadVoluntario(int id) {
    return _$loadVoluntarioAsyncAction.run(() => super.loadVoluntario(id));
  }

  late final _$updateNomeAsyncAction =
      AsyncAction('_VoluntarioStoreBase.updateNome', context: context);

  @override
  Future<void> updateNome(String nome) {
    return _$updateNomeAsyncAction.run(() => super.updateNome(nome));
  }

  late final _$updateEmailAsyncAction =
      AsyncAction('_VoluntarioStoreBase.updateEmail', context: context);

  @override
  Future<void> updateEmail(String email) {
    return _$updateEmailAsyncAction.run(() => super.updateEmail(email));
  }

  late final _$updateSenhaAsyncAction =
      AsyncAction('_VoluntarioStoreBase.updateSenha', context: context);

  @override
  Future<void> updateSenha(String senha) {
    return _$updateSenhaAsyncAction.run(() => super.updateSenha(senha));
  }

  @override
  String toString() {
    return '''
voluntario: ${voluntario},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}

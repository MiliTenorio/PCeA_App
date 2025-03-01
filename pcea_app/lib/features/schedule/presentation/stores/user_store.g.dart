// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  late final _$userAtom = Atom(name: '_UserStore.user', context: context);

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$userNameAtom =
      Atom(name: '_UserStore.userName', context: context);

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  void updateUserName() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.updateUserName');
    try {
      return super.updateUserName();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateAvailabilitySchedule(List<Schedule> newAvailability) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.updateAvailabilitySchedule');
    try {
      return super.updateAvailabilitySchedule(newAvailability);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
userName: ${userName}
    ''';
  }
}

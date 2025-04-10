// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  Computed<ScheduleStatus>? _$scheduleStatusComputed;

  @override
  ScheduleStatus get scheduleStatus => (_$scheduleStatusComputed ??=
          Computed<ScheduleStatus>(() => super.scheduleStatus,
              name: '_UserStore.scheduleStatus'))
      .value;

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

  late final _$userAvailableDatesAtom =
      Atom(name: '_UserStore.userAvailableDates', context: context);

  @override
  ObservableList<DateTime> get userAvailableDates {
    _$userAvailableDatesAtom.reportRead();
    return super.userAvailableDates;
  }

  @override
  set userAvailableDates(ObservableList<DateTime> value) {
    _$userAvailableDatesAtom.reportWrite(value, super.userAvailableDates, () {
      super.userAvailableDates = value;
    });
  }

  late final _$userScheduledDatesAtom =
      Atom(name: '_UserStore.userScheduledDates', context: context);

  @override
  ObservableList<DateTime> get userScheduledDates {
    _$userScheduledDatesAtom.reportRead();
    return super.userScheduledDates;
  }

  @override
  set userScheduledDates(ObservableList<DateTime> value) {
    _$userScheduledDatesAtom.reportWrite(value, super.userScheduledDates, () {
      super.userScheduledDates = value;
    });
  }

  late final _$allDatesAtom =
      Atom(name: '_UserStore.allDates', context: context);

  @override
  List<DateTime> get allDates {
    _$allDatesAtom.reportRead();
    return super.allDates;
  }

  @override
  set allDates(List<DateTime> value) {
    _$allDatesAtom.reportWrite(value, super.allDates, () {
      super.allDates = value;
    });
  }

  late final _$loadUserAsyncAction =
      AsyncAction('_UserStore.loadUser', context: context);

  @override
  Future<void> loadUser() {
    return _$loadUserAsyncAction.run(() => super.loadUser());
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  void loadAllDates() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.loadAllDates');
    try {
      return super.loadAllDates();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getAvailableDates() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.getAvailableDates');
    try {
      return super.getAvailableDates();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getScheduledDates() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.getScheduledDates');
    try {
      return super.getScheduledDates();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateAvailableDatesSchedule() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.updateAvailableDatesSchedule');
    try {
      return super.updateAvailableDatesSchedule();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleDateSelection(DateTime date) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.toggleDateSelection');
    try {
      return super.toggleDateSelection(date);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSelection() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.clearSelection');
    try {
      return super.clearSelection();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
userAvailableDates: ${userAvailableDates},
userScheduledDates: ${userScheduledDates},
allDates: ${allDates},
scheduleStatus: ${scheduleStatus}
    ''';
  }
}

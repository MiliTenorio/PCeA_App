// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_status_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScheduleStatusStore on _ScheduleStatusStoreBase, Store {
  late final _$scheduleStatusAtom =
      Atom(name: '_ScheduleStatusStoreBase.scheduleStatus', context: context);

  @override
  ScheduleStatus? get scheduleStatus {
    _$scheduleStatusAtom.reportRead();
    return super.scheduleStatus;
  }

  @override
  set scheduleStatus(ScheduleStatus? value) {
    _$scheduleStatusAtom.reportWrite(value, super.scheduleStatus, () {
      super.scheduleStatus = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ScheduleStatusStoreBase.isLoading', context: context);

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

  late final _$loadStatusAsyncAction =
      AsyncAction('_ScheduleStatusStoreBase.loadStatus', context: context);

  @override
  Future<void> loadStatus() {
    return _$loadStatusAsyncAction.run(() => super.loadStatus());
  }

  late final _$setAvailableDatesAsyncAction = AsyncAction(
      '_ScheduleStatusStoreBase.setAvailableDates',
      context: context);

  @override
  Future<void> setAvailableDates(List<String> dates) {
    return _$setAvailableDatesAsyncAction
        .run(() => super.setAvailableDates(dates));
  }

  late final _$_ScheduleStatusStoreBaseActionController =
      ActionController(name: '_ScheduleStatusStoreBase', context: context);

  @override
  void simulateBeingScheduled() {
    final _$actionInfo = _$_ScheduleStatusStoreBaseActionController.startAction(
        name: '_ScheduleStatusStoreBase.simulateBeingScheduled');
    try {
      return super.simulateBeingScheduled();
    } finally {
      _$_ScheduleStatusStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scheduleStatus: ${scheduleStatus},
isLoading: ${isLoading}
    ''';
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:fic16_absensi/data/datasources/auth_remote_datasource.dart';
import 'package:fic16_absensi/data/models/response/notification_response_model.dart';

part 'notification_bloc.freezed.dart';
part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final AuthRemoteDatasource datasource;
  NotificationBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_GetNotif>((event, emit) async {
      final result = await datasource.getNotification();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}

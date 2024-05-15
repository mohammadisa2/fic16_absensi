import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fic16_absensi/data/models/request/checkinout_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:fic16_absensi/data/datasources/attendance_remote_datasource.dart';
import 'package:fic16_absensi/data/models/response/checkinout_response_model.dart';

part 'checkin_attendance_bloc.freezed.dart';
part 'checkin_attendance_event.dart';
part 'checkin_attendance_state.dart';

class CheckinAttendanceBloc
    extends Bloc<CheckinAttendanceEvent, CheckinAttendanceState> {
  final AttendanceRemoteDatasource datasource;
  CheckinAttendanceBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_Checkin>((event, emit) async {
      emit(const _Loading());
      final requestModel = CheckInOutRequestModel(
        latitude: event.latitute,
        longitude: event.longitude,
        companyId: event.companyId,
      );
      final result = await datasource.checkin(requestModel);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}

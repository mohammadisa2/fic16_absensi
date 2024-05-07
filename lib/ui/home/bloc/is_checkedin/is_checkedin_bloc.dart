import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/attendance_remote_datasource.dart';

part 'is_checkedin_bloc.freezed.dart';
part 'is_checkedin_event.dart';
part 'is_checkedin_state.dart';

class IsCheckedinBloc extends Bloc<IsCheckedinEvent, IsCheckedinState> {
  final AttendanceRemoteDatasource datasource;
  IsCheckedinBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_IsCheckedIn>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.isCheckedin();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}

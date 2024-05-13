// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:fic16_absensi/data/models/response/note_response_model.dart';

import '../../../../data/datasources/note_remote_datasource.dart';

part 'get_note_bloc.freezed.dart';
part 'get_note_event.dart';
part 'get_note_state.dart';

class GetNoteBloc extends Bloc<GetNoteEvent, GetNoteState> {
  final NoteRemoteDatasource datasource;
  GetNoteBloc(
    this.datasource,
  ) : super(_Initial()) {
    on<_GetNotes>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.getNotes();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}

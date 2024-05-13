import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fic16_absensi/data/datasources/note_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_note_event.dart';
part 'add_note_state.dart';
part 'add_note_bloc.freezed.dart';

class AddNoteBloc extends Bloc<AddNoteEvent, AddNoteState> {
  final NoteRemoteDatasource datasource;
  AddNoteBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_AddNotes>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.addNote(event.title, event.description);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded()),
      );
    });
  }
}

part of 'add_note_bloc.dart';

@freezed
class AddNoteEvent with _$AddNoteEvent {
  const factory AddNoteEvent.started() = _Started;
  const factory AddNoteEvent.addNotes({
    required String title,
    required String description,
  }) = _AddNotes;
}

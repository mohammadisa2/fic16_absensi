part of 'get_note_bloc.dart';

@freezed
class GetNoteEvent with _$GetNoteEvent {
  const factory GetNoteEvent.started() = _Started;
  const factory GetNoteEvent.getNotes() = _GetNotes;
}

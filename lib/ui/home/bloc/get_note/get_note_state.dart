part of 'get_note_bloc.dart';

@freezed
class GetNoteState with _$GetNoteState {
  const factory GetNoteState.initial() = _Initial;
  const factory GetNoteState.loading() = _Loading;
  const factory GetNoteState.loaded(NoteResponseModel notes) = _Loaded;
  const factory GetNoteState.error(String message) = _Error;
  const factory GetNoteState.empty() = _Empty;
}

part of 'add_note_bloc.dart';

@freezed
class AddNoteState with _$AddNoteState {
  const factory AddNoteState.initial() = _Initial;
  const factory AddNoteState.loading() = _Loading;
  const factory AddNoteState.loaded() = _Loaded;
  const factory AddNoteState.error(String message) = _Error;
  const factory AddNoteState.empty() = _Empty;
}

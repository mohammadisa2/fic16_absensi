part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;
  const factory NotificationState.loading() = _Loading;
  const factory NotificationState.loaded(
      NotificationResponseModel notifications) = _Loaded;
  const factory NotificationState.error(String message) = _Error;
}

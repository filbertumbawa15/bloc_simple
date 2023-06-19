part of 'app_setting_cubit.dart';

@immutable
abstract class AppSettingState {}

class AppSettingLoading extends AppSettingState {}

class AppSettingUnAuthenticated extends AppSettingState {}

class AppSettingAuthenticated extends AppSettingState {}

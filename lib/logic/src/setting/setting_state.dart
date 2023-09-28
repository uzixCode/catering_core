part of 'setting_cubit.dart';

class SettingState {
  SettingState({
    this.status,
    this.kd,
  });

  final int? status;
  final String? kd;

  SettingState copyWith(SettingState? state) {
    return SettingState(
      kd: state?.kd ?? kd,
      status: state?.status ?? status,
    );
  }
}

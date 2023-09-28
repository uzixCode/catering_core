import 'package:catering_core/core.dart';
part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState());
  void emiting(SettingState? cstate) async {
    final pref = await SharedPreferences.getInstance();
    emit(state.copyWith(cstate));
    if (state.kd != null) {
      await pref.setString(StorageBox.kode, state.kd!);
    }
    if (state.status != null) {
      await pref.setInt(StorageBox.status, state.status!);
    }
  }

  Future load() async {
    final pref = await SharedPreferences.getInstance();
    final kode = pref.getString(StorageBox.kode);
    final status = pref.getInt(StorageBox.status);
    emit(state.copyWith(SettingState(kd: kode, status: status)));
  }

  Future reset() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
    emit(SettingState());
  }
}

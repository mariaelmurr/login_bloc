import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<bool> {
  ThemeCubit() : super(true);

  void toggleTheme({required bool value}) {
    emit(value);
  }

  @override
  bool? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return json['isDark'];
  }

  @override
  Map<String, dynamic>? toJson(bool state) {
    // TODO: implement toJson
    return {'isDark': state};
  }
}

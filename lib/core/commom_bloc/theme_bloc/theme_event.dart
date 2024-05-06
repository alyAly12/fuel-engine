part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class ThemeChange extends ThemeEvent {
  final bool isDark;

  ThemeChange(this.isDark);
}

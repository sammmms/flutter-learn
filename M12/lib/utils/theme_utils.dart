enum ThemeSelection { dark, light }

class ThemeSelectionUtils {
  final Map<String, ThemeSelection> _map = {
    "dark": ThemeSelection.dark,
    "light": ThemeSelection.light
  };
  final Map<ThemeSelection, String> _reverseMap = {
    ThemeSelection.dark: "dark",
    ThemeSelection.light: "light"
  };

  ThemeSelection themeStringOf(String string) {
    return _map[string] ?? ThemeSelection.light;
  }

  String stringThemeOf(ThemeSelection theme) {
    return _reverseMap[theme] ?? "light";
  }
}

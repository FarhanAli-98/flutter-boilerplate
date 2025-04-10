/// Assets Paths for dark and light mode
enum Drawables {
  logo(
    light: 'assets/icons/logo.svg',
  ),
  google(
    light: 'assets/icons/google.svg',
  ),
  apple(
    light: 'assets/icons/apple.svg',
  );

  const Drawables({
    required this.light,
  });
  final String light;
}

enum Routes {
  home(
    path: '/',
    name: 'Home',
  ),
  docs(
    path: '/docs',
    name: 'Docs',
  );

  final String path;
  final String name;

  const Routes({
    required this.path,
    required this.name,
  });
}
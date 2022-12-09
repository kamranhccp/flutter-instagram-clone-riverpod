enum LottieAnimation {
  dataNotFound(name: 'data_not_found'),
  loading(name: 'loading'),
  empty(name: 'empty'),
  error(name: 'error'),
  smallError(name: 'small_error');

  final String name;
  const LottieAnimation({
    required this.name,
  });
}

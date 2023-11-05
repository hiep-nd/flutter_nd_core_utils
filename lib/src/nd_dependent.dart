mixin NDDependent<T> {
  T? get depended => _depended;
  set depended(T? value) {
    _depended = value;
    for (var element in dependencyChild) {
      element.depended = value;
    }
  }

  Iterable<NDDependent<T>> get dependencyChild => [];

  // Privates
  T? _depended;
}

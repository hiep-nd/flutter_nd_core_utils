void setIfNeeded<T>(
  T Function() getter,
  void Function(T) setter,
  T Function() valuer,
) {
  final v = valuer();
  if (getter() != v) {
    setter(v);
  }
}

void ndSetIfNeeded<T>(
  T Function() getter,
  void Function(T) setter,
  T Function() valuer,
) =>
    setIfNeeded(
      getter,
      setter,
      valuer,
    );

T? cast<T>(dynamic value) => value is T ? value : null;

T? ndCast<T>(dynamic value) => cast<T>(value);
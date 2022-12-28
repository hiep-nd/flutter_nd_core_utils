/// Use with throw
// ignore: non_constant_identifier_names
Error notreached([String? message]) => message == null
    ? UnimplementedError('NOTREACHED')
    : UnimplementedError('NOTREACHED: $message');

Error ndNotreached([String? message]) => notreached(message);

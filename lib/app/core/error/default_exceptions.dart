class ConnectionException implements Exception {
  final String message;
  ConnectionException(this.message);
}

class InternalException implements Exception {
  final String message;
  InternalException(this.message);
}

class DefaultException implements Exception {
  final String message;
  DefaultException(this.message);
}

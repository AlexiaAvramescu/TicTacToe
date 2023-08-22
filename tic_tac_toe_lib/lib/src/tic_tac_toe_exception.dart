class XOGameException implements Exception {
  XOGameException(this.message);

  final String message;
}

class InvalidInputException extends XOGameException {
  InvalidInputException() : super('Invalid input.');
}

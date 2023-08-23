class XOGameException implements Exception {
  XOGameException(this.message);
  final String message;
}

class InvalidInputException extends XOGameException {
  InvalidInputException(this.message) : super(message);
  final String message;
}

class OutOfBoundInputException extends InvalidInputException {
  OutOfBoundInputException() : super('Out of bound input.');
}

class OccupiedPositionException extends InvalidInputException{
  OccupiedPositionException() : super('The position is occupied.');
}


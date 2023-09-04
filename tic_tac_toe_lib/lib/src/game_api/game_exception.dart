class GameException implements Exception {
  GameException(this.message);
  final String message;
}

class InvalidInputException extends GameException {
  InvalidInputException(this.message) : super(message);
  @override
  final String message;
}

class OutOfBoundInputException extends InvalidInputException {
  OutOfBoundInputException() : super('Out of bound input.');
}

class OccupiedPositionException extends InvalidInputException {
  OccupiedPositionException() : super('The position is occupied.');
}

class StrategyGetMoveError extends GameException {
  StrategyGetMoveError() : super('The function getMove did not return a valid position.');
}

class NotStatePlaying extends GameException {
  NotStatePlaying() : super('GameState is not Playing.');
}

class ListenerCanNotBeRemoved extends GameException {
  ListenerCanNotBeRemoved() : super('Listener not found to be removed.');
}

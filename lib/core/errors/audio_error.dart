abstract class AudioError implements Exception {
  final String message;
  const AudioError(this.message);
}

class AudioLoadException extends AudioError {
  const AudioLoadException(super.message);
}

class AudioSessionException extends AudioError {
  const AudioSessionException(super.message);
}

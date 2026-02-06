abstract class AudioException implements Exception {
  final String message;
  const AudioException(this.message);
}

class AudioLoadException extends AudioException {
  const AudioLoadException(super.message);
}

class AudioSessionException extends AudioException {
  const AudioSessionException(super.message);
}

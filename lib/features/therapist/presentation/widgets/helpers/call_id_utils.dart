String generateCallID({required String therapistId, required String userId}) {
  List<String> ids = [therapistId, userId];
  ids.sort();
  return ids.join("_");
}

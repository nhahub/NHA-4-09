import '../../../../core/constants/constants.dart';

/// Resolves joined author rows from Supabase PostgREST (`user_data` matches the rest of the app).
///
/// Falls back to `profiles` only for older DBs that still used that embed name.
Map<String, dynamic>? communityUserJoinRow(Map<String, dynamic> json) {
  for (final key in <String>[kUserDataTable, 'user_data']) {
    final v = json[key];
    if (v is Map<String, dynamic>) return v;
    if (v is List && v.isNotEmpty && v.first is Map<String, dynamic>) {
      return v.first as Map<String, dynamic>;
    }
  }
  return null;
}

String communityUserDisplayName(Map<String, dynamic> json) {
  final row = communityUserJoinRow(json);
  return (row?['user_name'] ?? '').toString();
}

String communityUserPictureUrl(Map<String, dynamic> json) {
  final row = communityUserJoinRow(json);
  return (row?['user_image'] ?? '').toString();
}

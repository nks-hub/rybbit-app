import '../models/session.dart';

const _colors = [
  'Red', 'Blue', 'Green', 'Yellow', 'Purple', 'Orange', 'Pink', 'Teal',
  'Cyan', 'Lime', 'Indigo', 'Amber', 'Coral', 'Violet', 'Maroon', 'Navy',
  'Olive', 'Silver', 'Gold', 'Crimson', 'Azure', 'Jade', 'Ruby', 'Ivory',
  'Copper', 'Bronze', 'Peach', 'Plum', 'Sage', 'Mint', 'Slate', 'Sand',
];

const _animals = [
  'Bear', 'Cat', 'Dog', 'Eagle', 'Fox', 'Hawk', 'Lion', 'Owl',
  'Wolf', 'Deer', 'Elk', 'Lynx', 'Orca', 'Puma', 'Swan', 'Viper',
  'Cobra', 'Crane', 'Dove', 'Duck', 'Frog', 'Goat', 'Hare', 'Ibis',
  'Mole', 'Newt', 'Panda', 'Raven', 'Seal', 'Tiger', 'Whale', 'Zebra',
];

/// Priority: traits.username > traits.name > traits.email > identified_user_id > generated name
String getUserDisplayName(AnalyticsSession session) {
  final traits = session.traits;
  if (traits != null) {
    final username = traits['username']?.toString();
    if (username != null && username.isNotEmpty) return username;
    final name = traits['name']?.toString();
    if (name != null && name.isNotEmpty) return name;
    final email = traits['email']?.toString();
    if (email != null && email.isNotEmpty) return email;
  }

  if (isIdentified(session)) return session.identifiedUserId!;

  final userId = session.userId;
  if (userId != null && userId.isNotEmpty) return generateName(userId);
  return 'Anonymous';
}

/// Deterministic name generation from user_id (Color + Animal pattern)
String generateName(String id) {
  int hash = 0;
  for (int i = 0; i < id.length; i++) {
    hash = ((hash << 5) - hash + id.codeUnitAt(i)) & 0x7FFFFFFF;
  }
  final color = _colors[hash % _colors.length];
  final animal = _animals[(hash ~/ _colors.length) % _animals.length];
  return '$color $animal';
}

bool isIdentified(AnalyticsSession session) =>
    session.identifiedUserId != null && session.identifiedUserId!.isNotEmpty;

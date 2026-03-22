class UserListItem {
  final String userId;
  final String? identifiedUserId;
  final int sessionCount;
  final String? lastSeen;
  final Map<String, dynamic>? traits;
  final String? deviceModel;
  final String? appVersion;

  const UserListItem({
    required this.userId,
    this.identifiedUserId,
    required this.sessionCount,
    this.lastSeen,
    this.traits,
    this.deviceModel,
    this.appVersion,
  });

  factory UserListItem.fromJson(Map<String, dynamic> json) {
    return UserListItem(
      userId: json['user_id'] as String? ?? json['userId'] as String? ?? '',
      identifiedUserId: json['identified_user_id'] as String? ??
          json['identifiedUserId'] as String?,
      sessionCount: (json['sessions'] as num?)?.toInt() ??
          (json['session_count'] as num?)?.toInt() ??
          (json['sessionCount'] as num?)?.toInt() ??
          0,
      lastSeen:
          json['last_seen'] as String? ?? json['lastSeen'] as String?,
      traits: json['traits'] as Map<String, dynamic>?,
      deviceModel: json['device_model'] as String?,
      appVersion: json['app_version'] as String?,
    );
  }
}

class UserDetail {
  final String userId;
  final String? identifiedUserId;
  final int sessionCount;
  final String? lastSeen;
  final Map<String, dynamic> traits;
  final String? deviceModel;
  final String? appVersion;

  const UserDetail({
    required this.userId,
    this.identifiedUserId,
    required this.sessionCount,
    this.lastSeen,
    this.traits = const {},
    this.deviceModel,
    this.appVersion,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      userId: json['user_id'] as String? ?? json['userId'] as String? ?? '',
      identifiedUserId: json['identified_user_id'] as String? ??
          json['identifiedUserId'] as String?,
      sessionCount: (json['sessions'] as num?)?.toInt() ??
          (json['session_count'] as num?)?.toInt() ??
          (json['sessionCount'] as num?)?.toInt() ??
          0,
      lastSeen:
          json['last_seen'] as String? ?? json['lastSeen'] as String?,
      traits: json['traits'] as Map<String, dynamic>? ?? {},
      deviceModel: json['device_model'] as String?,
      appVersion: json['app_version'] as String?,
    );
  }
}

class UsersPageResponse {
  final List<UserListItem> users;
  final int totalCount;
  final int page;
  final int pageSize;

  const UsersPageResponse({
    this.users = const [],
    this.totalCount = 0,
    this.page = 1,
    this.pageSize = 20,
  });
}

class TraitKey {
  final String key;
  final int userCount;

  const TraitKey({required this.key, required this.userCount});

  factory TraitKey.fromJson(Map<String, dynamic> json) {
    return TraitKey(
      key: json['key'] as String? ?? '',
      userCount: (json['userCount'] as num?)?.toInt() ?? 0,
    );
  }
}

class TraitValue {
  final String value;
  final int userCount;

  const TraitValue({required this.value, required this.userCount});

  factory TraitValue.fromJson(Map<String, dynamic> json) {
    return TraitValue(
      value: json['value'] as String? ?? '',
      userCount: (json['userCount'] as num?)?.toInt() ?? 0,
    );
  }
}

class TraitValuesResponse {
  final List<TraitValue> values;
  final int total;
  final bool hasMore;

  const TraitValuesResponse({
    this.values = const [],
    this.total = 0,
    this.hasMore = false,
  });

  factory TraitValuesResponse.fromJson(Map<String, dynamic> json) {
    final list = json['values'] as List? ?? [];
    return TraitValuesResponse(
      values: list
          .map((e) => TraitValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt() ?? 0,
      hasMore: json['hasMore'] as bool? ?? false,
    );
  }
}

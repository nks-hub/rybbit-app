// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metric.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MetricItem _$MetricItemFromJson(Map<String, dynamic> json) {
  return _MetricItem.fromJson(json);
}

/// @nodoc
mixin _$MetricItem {
  String get value => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get pathname => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;
  int? get pageviews => throw _privateConstructorUsedError;
  @JsonKey(name: 'pageviews_percentage')
  double? get pageviewsPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_on_page_seconds')
  double? get timeOnPageSeconds => throw _privateConstructorUsedError;
  @JsonKey(name: 'bounce_rate')
  double? get bounceRate => throw _privateConstructorUsedError;

  /// Serializes this MetricItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetricItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetricItemCopyWith<MetricItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetricItemCopyWith<$Res> {
  factory $MetricItemCopyWith(
    MetricItem value,
    $Res Function(MetricItem) then,
  ) = _$MetricItemCopyWithImpl<$Res, MetricItem>;
  @useResult
  $Res call({
    String value,
    String? title,
    String? pathname,
    int count,
    double percentage,
    int? pageviews,
    @JsonKey(name: 'pageviews_percentage') double? pageviewsPercentage,
    @JsonKey(name: 'time_on_page_seconds') double? timeOnPageSeconds,
    @JsonKey(name: 'bounce_rate') double? bounceRate,
  });
}

/// @nodoc
class _$MetricItemCopyWithImpl<$Res, $Val extends MetricItem>
    implements $MetricItemCopyWith<$Res> {
  _$MetricItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetricItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? title = freezed,
    Object? pathname = freezed,
    Object? count = null,
    Object? percentage = null,
    Object? pageviews = freezed,
    Object? pageviewsPercentage = freezed,
    Object? timeOnPageSeconds = freezed,
    Object? bounceRate = freezed,
  }) {
    return _then(
      _value.copyWith(
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as String,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            pathname: freezed == pathname
                ? _value.pathname
                : pathname // ignore: cast_nullable_to_non_nullable
                      as String?,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
            percentage: null == percentage
                ? _value.percentage
                : percentage // ignore: cast_nullable_to_non_nullable
                      as double,
            pageviews: freezed == pageviews
                ? _value.pageviews
                : pageviews // ignore: cast_nullable_to_non_nullable
                      as int?,
            pageviewsPercentage: freezed == pageviewsPercentage
                ? _value.pageviewsPercentage
                : pageviewsPercentage // ignore: cast_nullable_to_non_nullable
                      as double?,
            timeOnPageSeconds: freezed == timeOnPageSeconds
                ? _value.timeOnPageSeconds
                : timeOnPageSeconds // ignore: cast_nullable_to_non_nullable
                      as double?,
            bounceRate: freezed == bounceRate
                ? _value.bounceRate
                : bounceRate // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MetricItemImplCopyWith<$Res>
    implements $MetricItemCopyWith<$Res> {
  factory _$$MetricItemImplCopyWith(
    _$MetricItemImpl value,
    $Res Function(_$MetricItemImpl) then,
  ) = __$$MetricItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String value,
    String? title,
    String? pathname,
    int count,
    double percentage,
    int? pageviews,
    @JsonKey(name: 'pageviews_percentage') double? pageviewsPercentage,
    @JsonKey(name: 'time_on_page_seconds') double? timeOnPageSeconds,
    @JsonKey(name: 'bounce_rate') double? bounceRate,
  });
}

/// @nodoc
class __$$MetricItemImplCopyWithImpl<$Res>
    extends _$MetricItemCopyWithImpl<$Res, _$MetricItemImpl>
    implements _$$MetricItemImplCopyWith<$Res> {
  __$$MetricItemImplCopyWithImpl(
    _$MetricItemImpl _value,
    $Res Function(_$MetricItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MetricItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? title = freezed,
    Object? pathname = freezed,
    Object? count = null,
    Object? percentage = null,
    Object? pageviews = freezed,
    Object? pageviewsPercentage = freezed,
    Object? timeOnPageSeconds = freezed,
    Object? bounceRate = freezed,
  }) {
    return _then(
      _$MetricItemImpl(
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        pathname: freezed == pathname
            ? _value.pathname
            : pathname // ignore: cast_nullable_to_non_nullable
                  as String?,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
        percentage: null == percentage
            ? _value.percentage
            : percentage // ignore: cast_nullable_to_non_nullable
                  as double,
        pageviews: freezed == pageviews
            ? _value.pageviews
            : pageviews // ignore: cast_nullable_to_non_nullable
                  as int?,
        pageviewsPercentage: freezed == pageviewsPercentage
            ? _value.pageviewsPercentage
            : pageviewsPercentage // ignore: cast_nullable_to_non_nullable
                  as double?,
        timeOnPageSeconds: freezed == timeOnPageSeconds
            ? _value.timeOnPageSeconds
            : timeOnPageSeconds // ignore: cast_nullable_to_non_nullable
                  as double?,
        bounceRate: freezed == bounceRate
            ? _value.bounceRate
            : bounceRate // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MetricItemImpl implements _MetricItem {
  const _$MetricItemImpl({
    required this.value,
    this.title,
    this.pathname,
    this.count = 0,
    this.percentage = 0,
    this.pageviews,
    @JsonKey(name: 'pageviews_percentage') this.pageviewsPercentage,
    @JsonKey(name: 'time_on_page_seconds') this.timeOnPageSeconds,
    @JsonKey(name: 'bounce_rate') this.bounceRate,
  });

  factory _$MetricItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetricItemImplFromJson(json);

  @override
  final String value;
  @override
  final String? title;
  @override
  final String? pathname;
  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final double percentage;
  @override
  final int? pageviews;
  @override
  @JsonKey(name: 'pageviews_percentage')
  final double? pageviewsPercentage;
  @override
  @JsonKey(name: 'time_on_page_seconds')
  final double? timeOnPageSeconds;
  @override
  @JsonKey(name: 'bounce_rate')
  final double? bounceRate;

  @override
  String toString() {
    return 'MetricItem(value: $value, title: $title, pathname: $pathname, count: $count, percentage: $percentage, pageviews: $pageviews, pageviewsPercentage: $pageviewsPercentage, timeOnPageSeconds: $timeOnPageSeconds, bounceRate: $bounceRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetricItemImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.pathname, pathname) ||
                other.pathname == pathname) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.pageviews, pageviews) ||
                other.pageviews == pageviews) &&
            (identical(other.pageviewsPercentage, pageviewsPercentage) ||
                other.pageviewsPercentage == pageviewsPercentage) &&
            (identical(other.timeOnPageSeconds, timeOnPageSeconds) ||
                other.timeOnPageSeconds == timeOnPageSeconds) &&
            (identical(other.bounceRate, bounceRate) ||
                other.bounceRate == bounceRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    value,
    title,
    pathname,
    count,
    percentage,
    pageviews,
    pageviewsPercentage,
    timeOnPageSeconds,
    bounceRate,
  );

  /// Create a copy of MetricItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetricItemImplCopyWith<_$MetricItemImpl> get copyWith =>
      __$$MetricItemImplCopyWithImpl<_$MetricItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetricItemImplToJson(this);
  }
}

abstract class _MetricItem implements MetricItem {
  const factory _MetricItem({
    required final String value,
    final String? title,
    final String? pathname,
    final int count,
    final double percentage,
    final int? pageviews,
    @JsonKey(name: 'pageviews_percentage') final double? pageviewsPercentage,
    @JsonKey(name: 'time_on_page_seconds') final double? timeOnPageSeconds,
    @JsonKey(name: 'bounce_rate') final double? bounceRate,
  }) = _$MetricItemImpl;

  factory _MetricItem.fromJson(Map<String, dynamic> json) =
      _$MetricItemImpl.fromJson;

  @override
  String get value;
  @override
  String? get title;
  @override
  String? get pathname;
  @override
  int get count;
  @override
  double get percentage;
  @override
  int? get pageviews;
  @override
  @JsonKey(name: 'pageviews_percentage')
  double? get pageviewsPercentage;
  @override
  @JsonKey(name: 'time_on_page_seconds')
  double? get timeOnPageSeconds;
  @override
  @JsonKey(name: 'bounce_rate')
  double? get bounceRate;

  /// Create a copy of MetricItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetricItemImplCopyWith<_$MetricItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MetricResponse _$MetricResponseFromJson(Map<String, dynamic> json) {
  return _MetricResponse.fromJson(json);
}

/// @nodoc
mixin _$MetricResponse {
  List<MetricItem> get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;

  /// Serializes this MetricResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetricResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetricResponseCopyWith<MetricResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetricResponseCopyWith<$Res> {
  factory $MetricResponseCopyWith(
    MetricResponse value,
    $Res Function(MetricResponse) then,
  ) = _$MetricResponseCopyWithImpl<$Res, MetricResponse>;
  @useResult
  $Res call({
    List<MetricItem> data,
    @JsonKey(name: 'total_count') int totalCount,
  });
}

/// @nodoc
class _$MetricResponseCopyWithImpl<$Res, $Val extends MetricResponse>
    implements $MetricResponseCopyWith<$Res> {
  _$MetricResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetricResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null, Object? totalCount = null}) {
    return _then(
      _value.copyWith(
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<MetricItem>,
            totalCount: null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MetricResponseImplCopyWith<$Res>
    implements $MetricResponseCopyWith<$Res> {
  factory _$$MetricResponseImplCopyWith(
    _$MetricResponseImpl value,
    $Res Function(_$MetricResponseImpl) then,
  ) = __$$MetricResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<MetricItem> data,
    @JsonKey(name: 'total_count') int totalCount,
  });
}

/// @nodoc
class __$$MetricResponseImplCopyWithImpl<$Res>
    extends _$MetricResponseCopyWithImpl<$Res, _$MetricResponseImpl>
    implements _$$MetricResponseImplCopyWith<$Res> {
  __$$MetricResponseImplCopyWithImpl(
    _$MetricResponseImpl _value,
    $Res Function(_$MetricResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MetricResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null, Object? totalCount = null}) {
    return _then(
      _$MetricResponseImpl(
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<MetricItem>,
        totalCount: null == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MetricResponseImpl implements _MetricResponse {
  const _$MetricResponseImpl({
    required final List<MetricItem> data,
    @JsonKey(name: 'total_count') required this.totalCount,
  }) : _data = data;

  factory _$MetricResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetricResponseImplFromJson(json);

  final List<MetricItem> _data;
  @override
  List<MetricItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey(name: 'total_count')
  final int totalCount;

  @override
  String toString() {
    return 'MetricResponse(data: $data, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetricResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_data),
    totalCount,
  );

  /// Create a copy of MetricResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetricResponseImplCopyWith<_$MetricResponseImpl> get copyWith =>
      __$$MetricResponseImplCopyWithImpl<_$MetricResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MetricResponseImplToJson(this);
  }
}

abstract class _MetricResponse implements MetricResponse {
  const factory _MetricResponse({
    required final List<MetricItem> data,
    @JsonKey(name: 'total_count') required final int totalCount,
  }) = _$MetricResponseImpl;

  factory _MetricResponse.fromJson(Map<String, dynamic> json) =
      _$MetricResponseImpl.fromJson;

  @override
  List<MetricItem> get data;
  @override
  @JsonKey(name: 'total_count')
  int get totalCount;

  /// Create a copy of MetricResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetricResponseImplCopyWith<_$MetricResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

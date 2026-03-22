// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metric.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetricItem {

 String get value; String? get title; String? get pathname; int get count; double get percentage; int? get pageviews;@JsonKey(name: 'pageviews_percentage') double? get pageviewsPercentage;@JsonKey(name: 'time_on_page_seconds') double? get timeOnPageSeconds;@JsonKey(name: 'bounce_rate') double? get bounceRate;
/// Create a copy of MetricItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetricItemCopyWith<MetricItem> get copyWith => _$MetricItemCopyWithImpl<MetricItem>(this as MetricItem, _$identity);

  /// Serializes this MetricItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetricItem&&(identical(other.value, value) || other.value == value)&&(identical(other.title, title) || other.title == title)&&(identical(other.pathname, pathname) || other.pathname == pathname)&&(identical(other.count, count) || other.count == count)&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.pageviews, pageviews) || other.pageviews == pageviews)&&(identical(other.pageviewsPercentage, pageviewsPercentage) || other.pageviewsPercentage == pageviewsPercentage)&&(identical(other.timeOnPageSeconds, timeOnPageSeconds) || other.timeOnPageSeconds == timeOnPageSeconds)&&(identical(other.bounceRate, bounceRate) || other.bounceRate == bounceRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,title,pathname,count,percentage,pageviews,pageviewsPercentage,timeOnPageSeconds,bounceRate);

@override
String toString() {
  return 'MetricItem(value: $value, title: $title, pathname: $pathname, count: $count, percentage: $percentage, pageviews: $pageviews, pageviewsPercentage: $pageviewsPercentage, timeOnPageSeconds: $timeOnPageSeconds, bounceRate: $bounceRate)';
}


}

/// @nodoc
abstract mixin class $MetricItemCopyWith<$Res>  {
  factory $MetricItemCopyWith(MetricItem value, $Res Function(MetricItem) _then) = _$MetricItemCopyWithImpl;
@useResult
$Res call({
 String value, String? title, String? pathname, int count, double percentage, int? pageviews,@JsonKey(name: 'pageviews_percentage') double? pageviewsPercentage,@JsonKey(name: 'time_on_page_seconds') double? timeOnPageSeconds,@JsonKey(name: 'bounce_rate') double? bounceRate
});




}
/// @nodoc
class _$MetricItemCopyWithImpl<$Res>
    implements $MetricItemCopyWith<$Res> {
  _$MetricItemCopyWithImpl(this._self, this._then);

  final MetricItem _self;
  final $Res Function(MetricItem) _then;

/// Create a copy of MetricItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? title = freezed,Object? pathname = freezed,Object? count = null,Object? percentage = null,Object? pageviews = freezed,Object? pageviewsPercentage = freezed,Object? timeOnPageSeconds = freezed,Object? bounceRate = freezed,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,pathname: freezed == pathname ? _self.pathname : pathname // ignore: cast_nullable_to_non_nullable
as String?,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,pageviews: freezed == pageviews ? _self.pageviews : pageviews // ignore: cast_nullable_to_non_nullable
as int?,pageviewsPercentage: freezed == pageviewsPercentage ? _self.pageviewsPercentage : pageviewsPercentage // ignore: cast_nullable_to_non_nullable
as double?,timeOnPageSeconds: freezed == timeOnPageSeconds ? _self.timeOnPageSeconds : timeOnPageSeconds // ignore: cast_nullable_to_non_nullable
as double?,bounceRate: freezed == bounceRate ? _self.bounceRate : bounceRate // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [MetricItem].
extension MetricItemPatterns on MetricItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetricItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetricItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetricItem value)  $default,){
final _that = this;
switch (_that) {
case _MetricItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetricItem value)?  $default,){
final _that = this;
switch (_that) {
case _MetricItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  String? title,  String? pathname,  int count,  double percentage,  int? pageviews, @JsonKey(name: 'pageviews_percentage')  double? pageviewsPercentage, @JsonKey(name: 'time_on_page_seconds')  double? timeOnPageSeconds, @JsonKey(name: 'bounce_rate')  double? bounceRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetricItem() when $default != null:
return $default(_that.value,_that.title,_that.pathname,_that.count,_that.percentage,_that.pageviews,_that.pageviewsPercentage,_that.timeOnPageSeconds,_that.bounceRate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  String? title,  String? pathname,  int count,  double percentage,  int? pageviews, @JsonKey(name: 'pageviews_percentage')  double? pageviewsPercentage, @JsonKey(name: 'time_on_page_seconds')  double? timeOnPageSeconds, @JsonKey(name: 'bounce_rate')  double? bounceRate)  $default,) {final _that = this;
switch (_that) {
case _MetricItem():
return $default(_that.value,_that.title,_that.pathname,_that.count,_that.percentage,_that.pageviews,_that.pageviewsPercentage,_that.timeOnPageSeconds,_that.bounceRate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  String? title,  String? pathname,  int count,  double percentage,  int? pageviews, @JsonKey(name: 'pageviews_percentage')  double? pageviewsPercentage, @JsonKey(name: 'time_on_page_seconds')  double? timeOnPageSeconds, @JsonKey(name: 'bounce_rate')  double? bounceRate)?  $default,) {final _that = this;
switch (_that) {
case _MetricItem() when $default != null:
return $default(_that.value,_that.title,_that.pathname,_that.count,_that.percentage,_that.pageviews,_that.pageviewsPercentage,_that.timeOnPageSeconds,_that.bounceRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetricItem implements MetricItem {
  const _MetricItem({required this.value, this.title, this.pathname, this.count = 0, this.percentage = 0, this.pageviews, @JsonKey(name: 'pageviews_percentage') this.pageviewsPercentage, @JsonKey(name: 'time_on_page_seconds') this.timeOnPageSeconds, @JsonKey(name: 'bounce_rate') this.bounceRate});
  factory _MetricItem.fromJson(Map<String, dynamic> json) => _$MetricItemFromJson(json);

@override final  String value;
@override final  String? title;
@override final  String? pathname;
@override@JsonKey() final  int count;
@override@JsonKey() final  double percentage;
@override final  int? pageviews;
@override@JsonKey(name: 'pageviews_percentage') final  double? pageviewsPercentage;
@override@JsonKey(name: 'time_on_page_seconds') final  double? timeOnPageSeconds;
@override@JsonKey(name: 'bounce_rate') final  double? bounceRate;

/// Create a copy of MetricItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetricItemCopyWith<_MetricItem> get copyWith => __$MetricItemCopyWithImpl<_MetricItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetricItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetricItem&&(identical(other.value, value) || other.value == value)&&(identical(other.title, title) || other.title == title)&&(identical(other.pathname, pathname) || other.pathname == pathname)&&(identical(other.count, count) || other.count == count)&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.pageviews, pageviews) || other.pageviews == pageviews)&&(identical(other.pageviewsPercentage, pageviewsPercentage) || other.pageviewsPercentage == pageviewsPercentage)&&(identical(other.timeOnPageSeconds, timeOnPageSeconds) || other.timeOnPageSeconds == timeOnPageSeconds)&&(identical(other.bounceRate, bounceRate) || other.bounceRate == bounceRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,title,pathname,count,percentage,pageviews,pageviewsPercentage,timeOnPageSeconds,bounceRate);

@override
String toString() {
  return 'MetricItem(value: $value, title: $title, pathname: $pathname, count: $count, percentage: $percentage, pageviews: $pageviews, pageviewsPercentage: $pageviewsPercentage, timeOnPageSeconds: $timeOnPageSeconds, bounceRate: $bounceRate)';
}


}

/// @nodoc
abstract mixin class _$MetricItemCopyWith<$Res> implements $MetricItemCopyWith<$Res> {
  factory _$MetricItemCopyWith(_MetricItem value, $Res Function(_MetricItem) _then) = __$MetricItemCopyWithImpl;
@override @useResult
$Res call({
 String value, String? title, String? pathname, int count, double percentage, int? pageviews,@JsonKey(name: 'pageviews_percentage') double? pageviewsPercentage,@JsonKey(name: 'time_on_page_seconds') double? timeOnPageSeconds,@JsonKey(name: 'bounce_rate') double? bounceRate
});




}
/// @nodoc
class __$MetricItemCopyWithImpl<$Res>
    implements _$MetricItemCopyWith<$Res> {
  __$MetricItemCopyWithImpl(this._self, this._then);

  final _MetricItem _self;
  final $Res Function(_MetricItem) _then;

/// Create a copy of MetricItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? title = freezed,Object? pathname = freezed,Object? count = null,Object? percentage = null,Object? pageviews = freezed,Object? pageviewsPercentage = freezed,Object? timeOnPageSeconds = freezed,Object? bounceRate = freezed,}) {
  return _then(_MetricItem(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,pathname: freezed == pathname ? _self.pathname : pathname // ignore: cast_nullable_to_non_nullable
as String?,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,pageviews: freezed == pageviews ? _self.pageviews : pageviews // ignore: cast_nullable_to_non_nullable
as int?,pageviewsPercentage: freezed == pageviewsPercentage ? _self.pageviewsPercentage : pageviewsPercentage // ignore: cast_nullable_to_non_nullable
as double?,timeOnPageSeconds: freezed == timeOnPageSeconds ? _self.timeOnPageSeconds : timeOnPageSeconds // ignore: cast_nullable_to_non_nullable
as double?,bounceRate: freezed == bounceRate ? _self.bounceRate : bounceRate // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$MetricResponse {

 List<MetricItem> get data;@JsonKey(name: 'totalCount') int get totalCount;
/// Create a copy of MetricResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetricResponseCopyWith<MetricResponse> get copyWith => _$MetricResponseCopyWithImpl<MetricResponse>(this as MetricResponse, _$identity);

  /// Serializes this MetricResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetricResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),totalCount);

@override
String toString() {
  return 'MetricResponse(data: $data, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $MetricResponseCopyWith<$Res>  {
  factory $MetricResponseCopyWith(MetricResponse value, $Res Function(MetricResponse) _then) = _$MetricResponseCopyWithImpl;
@useResult
$Res call({
 List<MetricItem> data,@JsonKey(name: 'totalCount') int totalCount
});




}
/// @nodoc
class _$MetricResponseCopyWithImpl<$Res>
    implements $MetricResponseCopyWith<$Res> {
  _$MetricResponseCopyWithImpl(this._self, this._then);

  final MetricResponse _self;
  final $Res Function(MetricResponse) _then;

/// Create a copy of MetricResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? totalCount = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<MetricItem>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MetricResponse].
extension MetricResponsePatterns on MetricResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetricResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetricResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetricResponse value)  $default,){
final _that = this;
switch (_that) {
case _MetricResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetricResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MetricResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MetricItem> data, @JsonKey(name: 'totalCount')  int totalCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetricResponse() when $default != null:
return $default(_that.data,_that.totalCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MetricItem> data, @JsonKey(name: 'totalCount')  int totalCount)  $default,) {final _that = this;
switch (_that) {
case _MetricResponse():
return $default(_that.data,_that.totalCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MetricItem> data, @JsonKey(name: 'totalCount')  int totalCount)?  $default,) {final _that = this;
switch (_that) {
case _MetricResponse() when $default != null:
return $default(_that.data,_that.totalCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetricResponse implements MetricResponse {
  const _MetricResponse({required final  List<MetricItem> data, @JsonKey(name: 'totalCount') this.totalCount = 0}): _data = data;
  factory _MetricResponse.fromJson(Map<String, dynamic> json) => _$MetricResponseFromJson(json);

 final  List<MetricItem> _data;
@override List<MetricItem> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey(name: 'totalCount') final  int totalCount;

/// Create a copy of MetricResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetricResponseCopyWith<_MetricResponse> get copyWith => __$MetricResponseCopyWithImpl<_MetricResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetricResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetricResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),totalCount);

@override
String toString() {
  return 'MetricResponse(data: $data, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$MetricResponseCopyWith<$Res> implements $MetricResponseCopyWith<$Res> {
  factory _$MetricResponseCopyWith(_MetricResponse value, $Res Function(_MetricResponse) _then) = __$MetricResponseCopyWithImpl;
@override @useResult
$Res call({
 List<MetricItem> data,@JsonKey(name: 'totalCount') int totalCount
});




}
/// @nodoc
class __$MetricResponseCopyWithImpl<$Res>
    implements _$MetricResponseCopyWith<$Res> {
  __$MetricResponseCopyWithImpl(this._self, this._then);

  final _MetricResponse _self;
  final $Res Function(_MetricResponse) _then;

/// Create a copy of MetricResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? totalCount = null,}) {
  return _then(_MetricResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<MetricItem>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

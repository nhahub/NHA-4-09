// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'therapist_reviews_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TherapistReviewsState {

 TherapistReviewsStatus get status; List<TherapistReviewModel> get reviews; double? get average; int? get totalCount; num get userRating; int get selectedAnonymousIndex; bool get displayAnonymously; bool get hasUserRated; String? get error;
/// Create a copy of TherapistReviewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TherapistReviewsStateCopyWith<TherapistReviewsState> get copyWith => _$TherapistReviewsStateCopyWithImpl<TherapistReviewsState>(this as TherapistReviewsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TherapistReviewsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.reviews, reviews)&&(identical(other.average, average) || other.average == average)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.userRating, userRating) || other.userRating == userRating)&&(identical(other.selectedAnonymousIndex, selectedAnonymousIndex) || other.selectedAnonymousIndex == selectedAnonymousIndex)&&(identical(other.displayAnonymously, displayAnonymously) || other.displayAnonymously == displayAnonymously)&&(identical(other.hasUserRated, hasUserRated) || other.hasUserRated == hasUserRated)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(reviews),average,totalCount,userRating,selectedAnonymousIndex,displayAnonymously,hasUserRated,error);

@override
String toString() {
  return 'TherapistReviewsState(status: $status, reviews: $reviews, average: $average, totalCount: $totalCount, userRating: $userRating, selectedAnonymousIndex: $selectedAnonymousIndex, displayAnonymously: $displayAnonymously, hasUserRated: $hasUserRated, error: $error)';
}


}

/// @nodoc
abstract mixin class $TherapistReviewsStateCopyWith<$Res>  {
  factory $TherapistReviewsStateCopyWith(TherapistReviewsState value, $Res Function(TherapistReviewsState) _then) = _$TherapistReviewsStateCopyWithImpl;
@useResult
$Res call({
 TherapistReviewsStatus status, List<TherapistReviewModel> reviews, double? average, int? totalCount, num userRating, int selectedAnonymousIndex, bool displayAnonymously, bool hasUserRated, String? error
});




}
/// @nodoc
class _$TherapistReviewsStateCopyWithImpl<$Res>
    implements $TherapistReviewsStateCopyWith<$Res> {
  _$TherapistReviewsStateCopyWithImpl(this._self, this._then);

  final TherapistReviewsState _self;
  final $Res Function(TherapistReviewsState) _then;

/// Create a copy of TherapistReviewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? reviews = null,Object? average = freezed,Object? totalCount = freezed,Object? userRating = null,Object? selectedAnonymousIndex = null,Object? displayAnonymously = null,Object? hasUserRated = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TherapistReviewsStatus,reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<TherapistReviewModel>,average: freezed == average ? _self.average : average // ignore: cast_nullable_to_non_nullable
as double?,totalCount: freezed == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int?,userRating: null == userRating ? _self.userRating : userRating // ignore: cast_nullable_to_non_nullable
as num,selectedAnonymousIndex: null == selectedAnonymousIndex ? _self.selectedAnonymousIndex : selectedAnonymousIndex // ignore: cast_nullable_to_non_nullable
as int,displayAnonymously: null == displayAnonymously ? _self.displayAnonymously : displayAnonymously // ignore: cast_nullable_to_non_nullable
as bool,hasUserRated: null == hasUserRated ? _self.hasUserRated : hasUserRated // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TherapistReviewsState].
extension TherapistReviewsStatePatterns on TherapistReviewsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TherapistReviewsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TherapistReviewsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TherapistReviewsState value)  $default,){
final _that = this;
switch (_that) {
case _TherapistReviewsState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TherapistReviewsState value)?  $default,){
final _that = this;
switch (_that) {
case _TherapistReviewsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TherapistReviewsStatus status,  List<TherapistReviewModel> reviews,  double? average,  int? totalCount,  num userRating,  int selectedAnonymousIndex,  bool displayAnonymously,  bool hasUserRated,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TherapistReviewsState() when $default != null:
return $default(_that.status,_that.reviews,_that.average,_that.totalCount,_that.userRating,_that.selectedAnonymousIndex,_that.displayAnonymously,_that.hasUserRated,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TherapistReviewsStatus status,  List<TherapistReviewModel> reviews,  double? average,  int? totalCount,  num userRating,  int selectedAnonymousIndex,  bool displayAnonymously,  bool hasUserRated,  String? error)  $default,) {final _that = this;
switch (_that) {
case _TherapistReviewsState():
return $default(_that.status,_that.reviews,_that.average,_that.totalCount,_that.userRating,_that.selectedAnonymousIndex,_that.displayAnonymously,_that.hasUserRated,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TherapistReviewsStatus status,  List<TherapistReviewModel> reviews,  double? average,  int? totalCount,  num userRating,  int selectedAnonymousIndex,  bool displayAnonymously,  bool hasUserRated,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _TherapistReviewsState() when $default != null:
return $default(_that.status,_that.reviews,_that.average,_that.totalCount,_that.userRating,_that.selectedAnonymousIndex,_that.displayAnonymously,_that.hasUserRated,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _TherapistReviewsState implements TherapistReviewsState {
  const _TherapistReviewsState({this.status = TherapistReviewsStatus.initial, final  List<TherapistReviewModel> reviews = const <TherapistReviewModel>[], this.average, this.totalCount, this.userRating = 0, this.selectedAnonymousIndex = 0, this.displayAnonymously = false, this.hasUserRated = false, this.error}): _reviews = reviews;
  

@override@JsonKey() final  TherapistReviewsStatus status;
 final  List<TherapistReviewModel> _reviews;
@override@JsonKey() List<TherapistReviewModel> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}

@override final  double? average;
@override final  int? totalCount;
@override@JsonKey() final  num userRating;
@override@JsonKey() final  int selectedAnonymousIndex;
@override@JsonKey() final  bool displayAnonymously;
@override@JsonKey() final  bool hasUserRated;
@override final  String? error;

/// Create a copy of TherapistReviewsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TherapistReviewsStateCopyWith<_TherapistReviewsState> get copyWith => __$TherapistReviewsStateCopyWithImpl<_TherapistReviewsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TherapistReviewsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._reviews, _reviews)&&(identical(other.average, average) || other.average == average)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.userRating, userRating) || other.userRating == userRating)&&(identical(other.selectedAnonymousIndex, selectedAnonymousIndex) || other.selectedAnonymousIndex == selectedAnonymousIndex)&&(identical(other.displayAnonymously, displayAnonymously) || other.displayAnonymously == displayAnonymously)&&(identical(other.hasUserRated, hasUserRated) || other.hasUserRated == hasUserRated)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_reviews),average,totalCount,userRating,selectedAnonymousIndex,displayAnonymously,hasUserRated,error);

@override
String toString() {
  return 'TherapistReviewsState(status: $status, reviews: $reviews, average: $average, totalCount: $totalCount, userRating: $userRating, selectedAnonymousIndex: $selectedAnonymousIndex, displayAnonymously: $displayAnonymously, hasUserRated: $hasUserRated, error: $error)';
}


}

/// @nodoc
abstract mixin class _$TherapistReviewsStateCopyWith<$Res> implements $TherapistReviewsStateCopyWith<$Res> {
  factory _$TherapistReviewsStateCopyWith(_TherapistReviewsState value, $Res Function(_TherapistReviewsState) _then) = __$TherapistReviewsStateCopyWithImpl;
@override @useResult
$Res call({
 TherapistReviewsStatus status, List<TherapistReviewModel> reviews, double? average, int? totalCount, num userRating, int selectedAnonymousIndex, bool displayAnonymously, bool hasUserRated, String? error
});




}
/// @nodoc
class __$TherapistReviewsStateCopyWithImpl<$Res>
    implements _$TherapistReviewsStateCopyWith<$Res> {
  __$TherapistReviewsStateCopyWithImpl(this._self, this._then);

  final _TherapistReviewsState _self;
  final $Res Function(_TherapistReviewsState) _then;

/// Create a copy of TherapistReviewsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? reviews = null,Object? average = freezed,Object? totalCount = freezed,Object? userRating = null,Object? selectedAnonymousIndex = null,Object? displayAnonymously = null,Object? hasUserRated = null,Object? error = freezed,}) {
  return _then(_TherapistReviewsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TherapistReviewsStatus,reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<TherapistReviewModel>,average: freezed == average ? _self.average : average // ignore: cast_nullable_to_non_nullable
as double?,totalCount: freezed == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int?,userRating: null == userRating ? _self.userRating : userRating // ignore: cast_nullable_to_non_nullable
as num,selectedAnonymousIndex: null == selectedAnonymousIndex ? _self.selectedAnonymousIndex : selectedAnonymousIndex // ignore: cast_nullable_to_non_nullable
as int,displayAnonymously: null == displayAnonymously ? _self.displayAnonymously : displayAnonymously // ignore: cast_nullable_to_non_nullable
as bool,hasUserRated: null == hasUserRated ? _self.hasUserRated : hasUserRated // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

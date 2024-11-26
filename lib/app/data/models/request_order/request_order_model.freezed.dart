// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestOrderModel _$RequestOrderModelFromJson(Map<String, dynamic> json) {
  return _RequestOrderModel.fromJson(json);
}

/// @nodoc
mixin _$RequestOrderModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get catalogId => throw _privateConstructorUsedError;
  List<VideoPostModel>? get videos => throw _privateConstructorUsedError;
  VideoPostModel? get video => throw _privateConstructorUsedError;

  /// Serializes this RequestOrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestOrderModelCopyWith<RequestOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOrderModelCopyWith<$Res> {
  factory $RequestOrderModelCopyWith(
          RequestOrderModel value, $Res Function(RequestOrderModel) then) =
      _$RequestOrderModelCopyWithImpl<$Res, RequestOrderModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String imageUrl,
      String type,
      String? catalogId,
      List<VideoPostModel>? videos,
      VideoPostModel? video});

  $VideoPostModelCopyWith<$Res>? get video;
}

/// @nodoc
class _$RequestOrderModelCopyWithImpl<$Res, $Val extends RequestOrderModel>
    implements $RequestOrderModelCopyWith<$Res> {
  _$RequestOrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? imageUrl = null,
    Object? type = null,
    Object? catalogId = freezed,
    Object? videos = freezed,
    Object? video = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      catalogId: freezed == catalogId
          ? _value.catalogId
          : catalogId // ignore: cast_nullable_to_non_nullable
              as String?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<VideoPostModel>?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as VideoPostModel?,
    ) as $Val);
  }

  /// Create a copy of RequestOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VideoPostModelCopyWith<$Res>? get video {
    if (_value.video == null) {
      return null;
    }

    return $VideoPostModelCopyWith<$Res>(_value.video!, (value) {
      return _then(_value.copyWith(video: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RequestOrderModelImplCopyWith<$Res>
    implements $RequestOrderModelCopyWith<$Res> {
  factory _$$RequestOrderModelImplCopyWith(_$RequestOrderModelImpl value,
          $Res Function(_$RequestOrderModelImpl) then) =
      __$$RequestOrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String imageUrl,
      String type,
      String? catalogId,
      List<VideoPostModel>? videos,
      VideoPostModel? video});

  @override
  $VideoPostModelCopyWith<$Res>? get video;
}

/// @nodoc
class __$$RequestOrderModelImplCopyWithImpl<$Res>
    extends _$RequestOrderModelCopyWithImpl<$Res, _$RequestOrderModelImpl>
    implements _$$RequestOrderModelImplCopyWith<$Res> {
  __$$RequestOrderModelImplCopyWithImpl(_$RequestOrderModelImpl _value,
      $Res Function(_$RequestOrderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? imageUrl = null,
    Object? type = null,
    Object? catalogId = freezed,
    Object? videos = freezed,
    Object? video = freezed,
  }) {
    return _then(_$RequestOrderModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      catalogId: freezed == catalogId
          ? _value.catalogId
          : catalogId // ignore: cast_nullable_to_non_nullable
              as String?,
      videos: freezed == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<VideoPostModel>?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as VideoPostModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestOrderModelImpl extends _RequestOrderModel {
  const _$RequestOrderModelImpl(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.type,
      this.catalogId,
      final List<VideoPostModel>? videos,
      this.video})
      : _videos = videos,
        super._();

  factory _$RequestOrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestOrderModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String imageUrl;
  @override
  final String type;
  @override
  final String? catalogId;
  final List<VideoPostModel>? _videos;
  @override
  List<VideoPostModel>? get videos {
    final value = _videos;
    if (value == null) return null;
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final VideoPostModel? video;

  @override
  String toString() {
    return 'RequestOrderModel(id: $id, title: $title, imageUrl: $imageUrl, type: $type, catalogId: $catalogId, videos: $videos, video: $video)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.catalogId, catalogId) ||
                other.catalogId == catalogId) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            (identical(other.video, video) || other.video == video));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, imageUrl, type,
      catalogId, const DeepCollectionEquality().hash(_videos), video);

  /// Create a copy of RequestOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestOrderModelImplCopyWith<_$RequestOrderModelImpl> get copyWith =>
      __$$RequestOrderModelImplCopyWithImpl<_$RequestOrderModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestOrderModelImplToJson(
      this,
    );
  }
}

abstract class _RequestOrderModel extends RequestOrderModel {
  const factory _RequestOrderModel(
      {required final String id,
      required final String title,
      required final String imageUrl,
      required final String type,
      final String? catalogId,
      final List<VideoPostModel>? videos,
      final VideoPostModel? video}) = _$RequestOrderModelImpl;
  const _RequestOrderModel._() : super._();

  factory _RequestOrderModel.fromJson(Map<String, dynamic> json) =
      _$RequestOrderModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get imageUrl;
  @override
  String get type;
  @override
  String? get catalogId;
  @override
  List<VideoPostModel>? get videos;
  @override
  VideoPostModel? get video;

  /// Create a copy of RequestOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestOrderModelImplCopyWith<_$RequestOrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

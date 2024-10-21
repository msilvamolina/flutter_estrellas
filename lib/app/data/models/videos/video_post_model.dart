import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/friendly_helpers.dart';
import '../../helpers/model_helpers.dart';

part 'video_post_model.freezed.dart';
part 'video_post_model.g.dart';

@freezed
abstract class VideoPostModel implements _$VideoPostModel {
  const VideoPostModel._();

  const factory VideoPostModel({
    required String name,
    required String id,
    required String createdAt,
    required String thumbnail,
    required String videoUrl,
    required String createdByEmail,
    required String createdById,
    String? searchField,
    dynamic reference,
    String? updatedAt,
  }) = _VideoPostModel;

  factory VideoPostModel.fromJson(Map<String, dynamic> json) =>
      _$VideoPostModelFromJson(json);

  factory VideoPostModel.fromDocument(DocumentSnapshot doc) {
    VideoPostModel data =
        VideoPostModel.fromJson(ModelHelpers.fromDocument(doc.data()!));
    String searchField = data.name;

    return data.copyWith(
      reference: doc.reference,
      searchField: FriendlyHelpers.friendlySearchField(searchField),
    );
  }

  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());

  static Future<VideoPostModel?> fromReference(dynamic reference) async {
    try {
      DocumentSnapshot<Object?>? data =
          await ModelHelpers.fromReference(reference as DocumentReference);

      if (data != null) {
        return VideoPostModel.fromDocument(data);
      }

      return null;
    } catch (_) {
      return null;
    }
  }
}

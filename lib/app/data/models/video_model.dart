class VideoModel {
  VideoModel({
    required this.id,
    required this.videoUrl,
    required this.imageUrl,
  });

  final String id;
  final String videoUrl;
  final String imageUrl;

  @override
  String toString() =>
      'VideoModel(id: $id, videoUrl: $videoUrl, imageUrl: $imageUrl)';
}

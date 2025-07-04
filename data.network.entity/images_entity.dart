import '../useless/data.network.entity/rendition_entity.dart';

class ImagesEntity {
  final RenditionEntity original;
  final RenditionEntity previewGif;

  ImagesEntity({
    required this.original,
    required this.previewGif,
  });


  factory ImagesEntity.fromJson(Map<String, dynamic> json) {
    return ImagesEntity(
      original: 
        RenditionEntity.fromJson(json['original'] as Map<String, dynamic>),
      previewGif: RenditionEntity.fromJson(
        json['previewGif'] as Map<String, dynamic>,
      ),
    );

  }
}
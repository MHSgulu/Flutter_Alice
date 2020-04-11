// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bingwallpaper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BingWallpaper _$BingWallpaperFromJson(Map<String, dynamic> json) {
  return BingWallpaper(
    images: (json['images'] as List)
        ?.map((e) =>
            e == null ? null : Images.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tooltips: json['tooltips'] == null
        ? null
        : Tooltips.fromJson(json['tooltips'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BingWallpaperToJson(BingWallpaper instance) =>
    <String, dynamic>{
      'images': instance.images,
      'tooltips': instance.tooltips,
    };

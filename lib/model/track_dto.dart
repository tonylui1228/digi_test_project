import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'track_dto.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class TrackDto {
  TrackDto({
    this.wrapperType,
    this.kind,
    this.trackId,
    this.artistName,
    this.trackName,
    this.trackViewUrl,
    this.previewUrl,
    this.artworkUrl100,
    this.primaryGenreName,
    this.shortDescription,
    this.longDescription,
    this.isStreamable,
    this.addToHistoryTime
  });

  @HiveField(0)
  final String? wrapperType;
  @HiveField(1)
  final String? kind;
  @HiveField(2)
  final int? trackId;
  @HiveField(3)
  final String? artistName;
  @HiveField(4)
  final String? trackName;
  @HiveField(5)
  final String? trackViewUrl;
  @HiveField(6)
  final String? previewUrl;
  @HiveField(7)
  final String? artworkUrl100;
  @HiveField(8)
  final String? primaryGenreName;
  @HiveField(9)
  final String? shortDescription;
  @HiveField(10)
  final String? longDescription;
  @HiveField(11)
  final bool? isStreamable;
  @HiveField(12)
  DateTime? addToHistoryTime;

  factory TrackDto.fromJson(Map<String, dynamic> json) => _$TrackDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TrackDtoToJson(this);

}
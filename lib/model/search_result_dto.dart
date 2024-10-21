import 'package:digi_test_project/model/track_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_result_dto.g.dart';

@JsonSerializable()
class SearchResultDto {
  SearchResultDto({
    required this.resultCount,
    required this.results,
  });

  final int resultCount;
  final List<TrackDto> results;

  factory SearchResultDto.fromJson(Map<String, dynamic> json) => _$SearchResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultDtoToJson(this);

}
import 'package:pokedex_flutter/models/named_api_resource.dart';

class VersionGameIndex {
  final int? gameIndex;
  final NamedApiResource? version;

  const VersionGameIndex(
    this.gameIndex,
    this.version,
  );

  factory VersionGameIndex.fromJson(Map<String, dynamic> json) {
    return VersionGameIndex(
      json["gameIndex"],
      json["version"],
    );
  }
}

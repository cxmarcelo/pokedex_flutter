class NamedApiResource {

  final String name;
  final String url;

  const NamedApiResource(
    this.name,
    this.url
  );

  factory NamedApiResource.fromJson(Map<String, dynamic> json) {
    return NamedApiResource(
      json["name"] ?? "",
      json["url"] ?? "",
    );
  }

}
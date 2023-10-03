class ExternalUrls {
  ExternalUrls({
    String? spotify,}){
    _spotify = spotify;
  }

  ExternalUrls.fromJson(Map<String,dynamic> json) {
    _spotify = json['spotify'];
  }
  String? _spotify;
  ExternalUrls copyWith({  String? spotify,
  }) => ExternalUrls(  spotify: spotify ?? _spotify,
  );
  String? get spotify => _spotify;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['spotify'] = _spotify;
    return map;
  }

}
class ExternalIds {
  ExternalIds({
    String? isrc,}){
    _isrc = isrc;
  }

  ExternalIds.fromJson(Map<String,dynamic> json) {
    _isrc = json['isrc'];
  }
  String? _isrc;
  ExternalIds copyWith({  String? isrc,
  }) => ExternalIds(  isrc: isrc ?? _isrc,
  );
  String? get isrc => _isrc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isrc'] = _isrc;
    return map;
  }

}
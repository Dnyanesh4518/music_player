class VideoThumbnail {
  VideoThumbnail({
    dynamic url,}){
    _url = url;
  }

  VideoThumbnail.fromJson(Map<String,dynamic> json) {
    _url = json['url'];
  }
  dynamic _url;
  VideoThumbnail copyWith({  dynamic url,
  }) => VideoThumbnail(  url: url ?? _url,
  );
  dynamic get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    return map;
  }

}
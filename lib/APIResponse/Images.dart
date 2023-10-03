class Images {
  Images({
    num? height,
    String? url,
    num? width,}){
    _height = height;
    _url = url;
    _width = width;
  }

  Images.fromJson(Map<String,dynamic> json) {
    _height = json['height'];
    _url = json['url'];
    _width = json['width'];
  }
  num? _height;
  String? _url;
  num? _width;
  Images copyWith({  num? height,
    String? url,
    num? width,
  }) => Images(  height: height ?? _height,
    url: url ?? _url,
    width: width ?? _width,
  );
  num? get height => _height;
  String? get url => _url;
  num? get width => _width;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['height'] = _height;
    map['url'] = _url;
    map['width'] = _width;
    return map;
  }

}
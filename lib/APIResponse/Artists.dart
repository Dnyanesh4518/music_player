import 'ExternalUrls.dart';

class Artists {
  Artists({
    ExternalUrls? externalUrls,
    String? id,
    String? name,
    String? type,
    String? uri,}){
    _externalUrls = externalUrls;
    _id = id;
    _name = name;
    _type = type;
    _uri = uri;
  }

  Artists.fromJson(Map<String,dynamic> json) {
    _externalUrls = json['external_urls'] != null ? ExternalUrls.fromJson(json['external_urls']) : null;
    _id = json['id'];
    _name = json['name'];
    _type = json['type'];
    _uri = json['uri'];
  }
  ExternalUrls? _externalUrls;
  String? _id;
  String? _name;
  String? _type;
  String? _uri;
  Artists copyWith({  ExternalUrls? externalUrls,
    String? id,
    String? name,
    String? type,
    String? uri,
  }) => Artists(  externalUrls: externalUrls ?? _externalUrls,
    id: id ?? _id,
    name: name ?? _name,
    type: type ?? _type,
    uri: uri ?? _uri,
  );
  ExternalUrls? get externalUrls => _externalUrls;
  String? get id => _id;
  String? get name => _name;
  String? get type => _type;
  String? get uri => _uri;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_externalUrls != null) {
      map['external_urls'] = _externalUrls?.toJson();
    }
    map['id'] = _id;
    map['name'] = _name;
    map['type'] = _type;
    map['uri'] = _uri;
    return map;
  }

}
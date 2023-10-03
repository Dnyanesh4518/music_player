import 'ExternalUrls.dart';

class AddedBy {
  AddedBy({
    ExternalUrls? externalUrls,
    String? id,
    String? type,
    String? uri,}){
    _externalUrls = externalUrls;
    _id = id;
    _type = type;
    _uri = uri;
  }

  AddedBy.fromJson(Map<String,dynamic> json) {
    _externalUrls = json['external_urls'] != null ? ExternalUrls.fromJson(json['external_urls']) : null;
    _id = json['id'];
    _type = json['type'];
    _uri = json['uri'];
  }
  ExternalUrls? _externalUrls;
  String? _id;
  String? _type;
  String? _uri;
  AddedBy copyWith({  ExternalUrls? externalUrls,
    String? id,
    String? type,
    String? uri,
  }) => AddedBy(  externalUrls: externalUrls ?? _externalUrls,
    id: id ?? _id,
    type: type ?? _type,
    uri: uri ?? _uri,
  );
  ExternalUrls? get externalUrls => _externalUrls;
  String? get id => _id;
  String? get type => _type;
  String? get uri => _uri;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_externalUrls != null) {
      map['external_urls'] = _externalUrls?.toJson();
    }
    map['id'] = _id;
    map['type'] = _type;
    map['uri'] = _uri;
    return map;
  }

}
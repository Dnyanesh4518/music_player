class SharingInfo {
  SharingInfo({
    String? shareId,
    String? shareUrl,
    String? uri,}){
    _shareId = shareId;
    _shareUrl = shareUrl;
    _uri = uri;
  }

  SharingInfo.fromJson(Map<String,dynamic> json) {
    _shareId = json['share_id'];
    _shareUrl = json['share_url'];
    _uri = json['uri'];
  }
  String? _shareId;
  String? _shareUrl;
  String? _uri;
  SharingInfo copyWith({  String? shareId,
    String? shareUrl,
    String? uri,
  }) => SharingInfo(  shareId: shareId ?? _shareId,
    shareUrl: shareUrl ?? _shareUrl,
    uri: uri ?? _uri,
  );
  String? get shareId => _shareId;
  String? get shareUrl => _shareUrl;
  String? get uri => _uri;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['share_id'] = _shareId;
    map['share_url'] = _shareUrl;
    map['uri'] = _uri;
    return map;
  }

}
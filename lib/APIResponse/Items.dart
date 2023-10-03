import 'AddedBy.dart';
import 'SharingInfo.dart';
import 'Track.dart';
import 'VideoThumbnail.dart';

class Items {
  Items({
    String? addedAt,
    AddedBy? addedBy,
    bool? isLocal,
    dynamic primaryColor,
    SharingInfo? sharingInfo,
    Track? track,
    VideoThumbnail? videoThumbnail,}){
    _addedAt = addedAt;
    _addedBy = addedBy;
    _isLocal = isLocal;
    _primaryColor = primaryColor;
    _sharingInfo = sharingInfo;
    _track = track;
    _videoThumbnail = videoThumbnail;
  }

  Items.fromJson(Map<String,dynamic> json) {
    _addedAt = json['added_at'];
    _addedBy = json['added_by'] != null ? AddedBy.fromJson(json['added_by']) : null;
    _isLocal = json['is_local'];
    _primaryColor = json['primary_color'];
    _sharingInfo = json['sharing_info'] != null ? SharingInfo.fromJson(json['sharing_info']) : null;
    _track = json['track'] != null ? Track.fromJson(json['track']) : null;
    _videoThumbnail = json['video_thumbnail'] != null ? VideoThumbnail.fromJson(json['video_thumbnail']) : null;
  }
  String? _addedAt;
  AddedBy? _addedBy;
  bool? _isLocal;
  dynamic _primaryColor;
  SharingInfo? _sharingInfo;
  Track? _track;
  VideoThumbnail? _videoThumbnail;
  Items copyWith({  String? addedAt,
    AddedBy? addedBy,
    bool? isLocal,
    dynamic primaryColor,
    SharingInfo? sharingInfo,
    Track? track,
    VideoThumbnail? videoThumbnail,
  }) => Items(  addedAt: addedAt ?? _addedAt,
    addedBy: addedBy ?? _addedBy,
    isLocal: isLocal ?? _isLocal,
    primaryColor: primaryColor ?? _primaryColor,
    sharingInfo: sharingInfo ?? _sharingInfo,
    track: track ?? _track,
    videoThumbnail: videoThumbnail ?? _videoThumbnail,
  );
  String? get addedAt => _addedAt;
  AddedBy? get addedBy => _addedBy;
  bool? get isLocal => _isLocal;
  dynamic get primaryColor => _primaryColor;
  SharingInfo? get sharingInfo => _sharingInfo;
  Track? get track => _track;
  VideoThumbnail? get videoThumbnail => _videoThumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['added_at'] = _addedAt;
    if (_addedBy != null) {
      map['added_by'] = _addedBy?.toJson();
    }
    map['is_local'] = _isLocal;
    map['primary_color'] = _primaryColor;
    if (_sharingInfo != null) {
      map['sharing_info'] = _sharingInfo?.toJson();
    }
    if (_track != null) {
      map['track'] = _track?.toJson();
    }
    if (_videoThumbnail != null) {
      map['video_thumbnail'] = _videoThumbnail?.toJson();
    }
    return map;
  }

}
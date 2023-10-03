import 'Album.dart';
import 'Artists.dart';
import 'ExternalIds.dart';
import 'ExternalUrls.dart';

class Track {
  Track({
    Album? album,
    List<Artists>? artists,
    num? discNumber,
    num? durationMs,
    bool? episode,
    bool? explicit,
    ExternalIds? externalIds,
    ExternalUrls? externalUrls,
    String? id,
    bool? isLocal,
    bool? isPlayable,
    String? name,
    num? popularity,
    String? previewUrl,
    bool? track,
    num? trackNumber,
    String? type,
    String? uri,}){
    _album = album;
    _artists = artists;
    _discNumber = discNumber;
    _durationMs = durationMs;
    _episode = episode;
    _explicit = explicit;
    _externalIds = externalIds;
    _externalUrls = externalUrls;
    _id = id;
    _isLocal = isLocal;
    _isPlayable = isPlayable;
    _name = name;
    _popularity = popularity;
    _previewUrl = previewUrl;
    _track = track;
    _trackNumber = trackNumber;
    _type = type;
    _uri = uri;
  }

  Track.fromJson(Map<String,dynamic> json) {
    _album = json['album'] != null ? Album.fromJson(json['album']) : null;
    if (json['artists'] != null) {
      _artists = [];
      json['artists'].forEach((v) {
        _artists?.add(Artists.fromJson(v));
      });
    }
    _discNumber = json['disc_number'];
    _durationMs = json['duration_ms'];
    _episode = json['episode'];
    _explicit = json['explicit'];
    _externalIds = json['external_ids'] != null ? ExternalIds.fromJson(json['external_ids']) : null;
    _externalUrls = json['external_urls'] != null ? ExternalUrls.fromJson(json['external_urls']) : null;
    _id = json['id'];
    _isLocal = json['is_local'];
    _isPlayable = json['is_playable'];
    _name = json['name'];
    _popularity = json['popularity'];
    _previewUrl = json['preview_url'];
    _track = json['track'];
    _trackNumber = json['track_number'];
    _type = json['type'];
    _uri = json['uri'];
  }
  Album? _album;
  List<Artists>? _artists;
  num? _discNumber;
  num? _durationMs;
  bool? _episode;
  bool? _explicit;
  ExternalIds? _externalIds;
  ExternalUrls? _externalUrls;
  String? _id;
  bool? _isLocal;
  bool? _isPlayable;
  String? _name;
  num? _popularity;
  String? _previewUrl;
  bool? _track;
  num? _trackNumber;
  String? _type;
  String? _uri;
  Track copyWith({  Album? album,
    List<Artists>? artists,
    num? discNumber,
    num? durationMs,
    bool? episode,
    bool? explicit,
    ExternalIds? externalIds,
    ExternalUrls? externalUrls,
    String? id,
    bool? isLocal,
    bool? isPlayable,
    String? name,
    num? popularity,
    String? previewUrl,
    bool? track,
    num? trackNumber,
    String? type,
    String? uri,
  }) => Track(  album: album ?? _album,
    artists: artists ?? _artists,
    discNumber: discNumber ?? _discNumber,
    durationMs: durationMs ?? _durationMs,
    episode: episode ?? _episode,
    explicit: explicit ?? _explicit,
    externalIds: externalIds ?? _externalIds,
    externalUrls: externalUrls ?? _externalUrls,
    id: id ?? _id,
    isLocal: isLocal ?? _isLocal,
    isPlayable: isPlayable ?? _isPlayable,
    name: name ?? _name,
    popularity: popularity ?? _popularity,
    previewUrl: previewUrl ?? _previewUrl,
    track: track ?? _track,
    trackNumber: trackNumber ?? _trackNumber,
    type: type ?? _type,
    uri: uri ?? _uri,
  );
  Album? get album => _album;
  List<Artists>? get artists => _artists;
  num? get discNumber => _discNumber;
  num? get durationMs => _durationMs;
  bool? get episode => _episode;
  bool? get explicit => _explicit;
  ExternalIds? get externalIds => _externalIds;
  ExternalUrls? get externalUrls => _externalUrls;
  String? get id => _id;
  bool? get isLocal => _isLocal;
  bool? get isPlayable => _isPlayable;
  String? get name => _name;
  num? get popularity => _popularity;
  String? get previewUrl => _previewUrl;
  bool? get track => _track;
  num? get trackNumber => _trackNumber;
  String? get type => _type;
  String? get uri => _uri;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_album != null) {
      map['album'] = _album?.toJson();
    }
    if (_artists != null) {
      map['artists'] = _artists?.map((v) => v.toJson()).toList();
    }
    map['disc_number'] = _discNumber;
    map['duration_ms'] = _durationMs;
    map['episode'] = _episode;
    map['explicit'] = _explicit;
    if (_externalIds != null) {
      map['external_ids'] = _externalIds?.toJson();
    }
    if (_externalUrls != null) {
      map['external_urls'] = _externalUrls?.toJson();
    }
    map['id'] = _id;
    map['is_local'] = _isLocal;
    map['is_playable'] = _isPlayable;
    map['name'] = _name;
    map['popularity'] = _popularity;
    map['preview_url'] = _previewUrl;
    map['track'] = _track;
    map['track_number'] = _trackNumber;
    map['type'] = _type;
    map['uri'] = _uri;
    return map;
  }

}
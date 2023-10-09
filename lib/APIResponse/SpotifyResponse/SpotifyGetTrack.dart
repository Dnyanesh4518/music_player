class SpotifyGetTrack {
  SpotifyGetTrack({
      List<Tracks>? tracks,}){
    _tracks = tracks;
}

  SpotifyGetTrack.fromJson(dynamic json) {
    if (json['tracks'] != null) {
      _tracks = [];
      json['tracks'].forEach((v) {
        _tracks?.add(Tracks.fromJson(v));
      });
    }
  }
  List<Tracks>? _tracks;
SpotifyGetTrack copyWith({  List<Tracks>? tracks,
}) => SpotifyGetTrack(  tracks: tracks ?? _tracks,
);
  List<Tracks>? get tracks => _tracks;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_tracks != null) {
      map['tracks'] = _tracks?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
class Tracks {
  Tracks({
      Album? album, 
      List<Artists>? artists, 
      num? discNumber, 
      num? durationMs, 
      bool? explicit, 
      ExternalIds? externalIds, 
      ExternalUrls? externalUrls, 
      String? id, 
      bool? isLocal, 
      bool? isPlayable, 
      String? name, 
      num? popularity, 
      String? previewUrl, 
      num? trackNumber, 
      String? type, 
      String? uri,}){
    _album = album;
    _artists = artists;
    _discNumber = discNumber;
    _durationMs = durationMs;
    _explicit = explicit;
    _externalIds = externalIds;
    _externalUrls = externalUrls;
    _id = id;
    _isLocal = isLocal;
    _isPlayable = isPlayable;
    _name = name;
    _popularity = popularity;
    _previewUrl = previewUrl;
    _trackNumber = trackNumber;
    _type = type;
    _uri = uri;
}

  Tracks.fromJson(dynamic json) {
    _album = json['album'] != null ? Album.fromJson(json['album']) : null;
    if (json['artists'] != null) {
      _artists = [];
      json['artists'].forEach((v) {
        _artists?.add(Artists.fromJson(v));
      });
    }
    _discNumber = json['disc_number'];
    _durationMs = json['duration_ms'];
    _explicit = json['explicit'];
    _externalIds = json['external_ids'] != null ? ExternalIds.fromJson(json['external_ids']) : null;
    _externalUrls = json['external_urls'] != null ? ExternalUrls.fromJson(json['external_urls']) : null;
    _id = json['id'];
    _isLocal = json['is_local'];
    _isPlayable = json['is_playable'];
    _name = json['name'];
    _popularity = json['popularity'];
    _previewUrl = json['preview_url'];
    _trackNumber = json['track_number'];
    _type = json['type'];
    _uri = json['uri'];
  }
  Album? _album;
  List<Artists>? _artists;
  num? _discNumber;
  num? _durationMs;
  bool? _explicit;
  ExternalIds? _externalIds;
  ExternalUrls? _externalUrls;
  String? _id;
  bool? _isLocal;
  bool? _isPlayable;
  String? _name;
  num? _popularity;
  String? _previewUrl;
  num? _trackNumber;
  String? _type;
  String? _uri;
Tracks copyWith({  Album? album,
  List<Artists>? artists,
  num? discNumber,
  num? durationMs,
  bool? explicit,
  ExternalIds? externalIds,
  ExternalUrls? externalUrls,
  String? id,
  bool? isLocal,
  bool? isPlayable,
  String? name,
  num? popularity,
  String? previewUrl,
  num? trackNumber,
  String? type,
  String? uri,
}) => Tracks(  album: album ?? _album,
  artists: artists ?? _artists,
  discNumber: discNumber ?? _discNumber,
  durationMs: durationMs ?? _durationMs,
  explicit: explicit ?? _explicit,
  externalIds: externalIds ?? _externalIds,
  externalUrls: externalUrls ?? _externalUrls,
  id: id ?? _id,
  isLocal: isLocal ?? _isLocal,
  isPlayable: isPlayable ?? _isPlayable,
  name: name ?? _name,
  popularity: popularity ?? _popularity,
  previewUrl: previewUrl ?? _previewUrl,
  trackNumber: trackNumber ?? _trackNumber,
  type: type ?? _type,
  uri: uri ?? _uri,
);
  Album? get album => _album;
  List<Artists>? get artists => _artists;
  num? get discNumber => _discNumber;
  num? get durationMs => _durationMs;
  bool? get explicit => _explicit;
  ExternalIds? get externalIds => _externalIds;
  ExternalUrls? get externalUrls => _externalUrls;
  String? get id => _id;
  bool? get isLocal => _isLocal;
  bool? get isPlayable => _isPlayable;
  String? get name => _name;
  num? get popularity => _popularity;
  String? get previewUrl => _previewUrl;
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
    map['track_number'] = _trackNumber;
    map['type'] = _type;
    map['uri'] = _uri;
    return map;
  }

}
class ExternalUrls {
  ExternalUrls({
      String? spotify,}){
    _spotify = spotify;
}

  ExternalUrls.fromJson(dynamic json) {
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
class ExternalIds {
  ExternalIds({
      String? isrc,}){
    _isrc = isrc;
}

  ExternalIds.fromJson(dynamic json) {
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

  Artists.fromJson(dynamic json) {
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
class Album {
  Album({
      String? albumType, 
      List<Artists>? artists, 
      ExternalUrls? externalUrls, 
      String? id, 
      List<Images>? images, 
      bool? isPlayable, 
      String? name, 
      String? releaseDate, 
      String? releaseDatePrecision, 
      num? totalTracks, 
      String? type, 
      String? uri,}){
    _albumType = albumType;
    _artists = artists;
    _externalUrls = externalUrls;
    _id = id;
    _images = images;
    _isPlayable = isPlayable;
    _name = name;
    _releaseDate = releaseDate;
    _releaseDatePrecision = releaseDatePrecision;
    _totalTracks = totalTracks;
    _type = type;
    _uri = uri;
}

  Album.fromJson(dynamic json) {
    _albumType = json['album_type'];
    if (json['artists'] != null) {
      _artists = [];
      json['artists'].forEach((v) {
        _artists?.add(Artists.fromJson(v));
      });
    }
    _externalUrls = json['external_urls'] != null ? ExternalUrls.fromJson(json['external_urls']) : null;
    _id = json['id'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
    _isPlayable = json['is_playable'];
    _name = json['name'];
    _releaseDate = json['release_date'];
    _releaseDatePrecision = json['release_date_precision'];
    _totalTracks = json['total_tracks'];
    _type = json['type'];
    _uri = json['uri'];
  }
  String? _albumType;
  List<Artists>? _artists;
  ExternalUrls? _externalUrls;
  String? _id;
  List<Images>? _images;
  bool? _isPlayable;
  String? _name;
  String? _releaseDate;
  String? _releaseDatePrecision;
  num? _totalTracks;
  String? _type;
  String? _uri;
Album copyWith({  String? albumType,
  List<Artists>? artists,
  ExternalUrls? externalUrls,
  String? id,
  List<Images>? images,
  bool? isPlayable,
  String? name,
  String? releaseDate,
  String? releaseDatePrecision,
  num? totalTracks,
  String? type,
  String? uri,
}) => Album(  albumType: albumType ?? _albumType,
  artists: artists ?? _artists,
  externalUrls: externalUrls ?? _externalUrls,
  id: id ?? _id,
  images: images ?? _images,
  isPlayable: isPlayable ?? _isPlayable,
  name: name ?? _name,
  releaseDate: releaseDate ?? _releaseDate,
  releaseDatePrecision: releaseDatePrecision ?? _releaseDatePrecision,
  totalTracks: totalTracks ?? _totalTracks,
  type: type ?? _type,
  uri: uri ?? _uri,
);
  String? get albumType => _albumType;
  List<Artists>? get artists => _artists;
  ExternalUrls? get externalUrls => _externalUrls;
  String? get id => _id;
  List<Images>? get images => _images;
  bool? get isPlayable => _isPlayable;
  String? get name => _name;
  String? get releaseDate => _releaseDate;
  String? get releaseDatePrecision => _releaseDatePrecision;
  num? get totalTracks => _totalTracks;
  String? get type => _type;
  String? get uri => _uri;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['album_type'] = _albumType;
    if (_artists != null) {
      map['artists'] = _artists?.map((v) => v.toJson()).toList();
    }
    if (_externalUrls != null) {
      map['external_urls'] = _externalUrls?.toJson();
    }
    map['id'] = _id;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    map['is_playable'] = _isPlayable;
    map['name'] = _name;
    map['release_date'] = _releaseDate;
    map['release_date_precision'] = _releaseDatePrecision;
    map['total_tracks'] = _totalTracks;
    map['type'] = _type;
    map['uri'] = _uri;
    return map;
  }

}
class Images {
  Images({
      num? height, 
      String? url, 
      num? width,}){
    _height = height;
    _url = url;
    _width = width;
}

  Images.fromJson(dynamic json) {
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




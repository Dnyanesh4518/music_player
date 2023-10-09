class SpotifySearch {
  SpotifySearch({
      String? query,
      Tracks? tracks,}){
    _query = query;
    _tracks = tracks;
}

  SpotifySearch.fromJson(dynamic json) {
    _query = json['query'];
    _tracks = json['tracks'] != null ? Tracks.fromJson(json['tracks']) : null;
  }
  String? _query;
  Tracks? _tracks;
SpotifySearch copyWith({  String? query,
  Tracks? tracks,
}) => SpotifySearch(  query: query ?? _query,
  tracks: tracks ?? _tracks,
);
  String? get query => _query;
  Tracks? get tracks => _tracks;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['query'] = _query;
    if (_tracks != null) {
      map['tracks'] = _tracks?.toJson();
    }
    return map;
  }

}
class Tracks {
  Tracks({
      num? totalCount,
      List<Items>? items,
      PagingInfo? pagingInfo,}){
    _totalCount = totalCount;
    _items = items;
    _pagingInfo = pagingInfo;
}

  Tracks.fromJson(dynamic json) {
    _totalCount = json['totalCount'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
    _pagingInfo = json['pagingInfo'] != null ? PagingInfo.fromJson(json['pagingInfo']) : null;
  }
  num? _totalCount;
  List<Items>? _items;
  PagingInfo? _pagingInfo;
Tracks copyWith({  num? totalCount,
  List<Items>? items,
  PagingInfo? pagingInfo,
}) => Tracks(  totalCount: totalCount ?? _totalCount,
  items: items ?? _items,
  pagingInfo: pagingInfo ?? _pagingInfo,
);
  num? get totalCount => _totalCount;
  List<Items>? get items => _items;
  PagingInfo? get pagingInfo => _pagingInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalCount'] = _totalCount;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    if (_pagingInfo != null) {
      map['pagingInfo'] = _pagingInfo?.toJson();
    }
    return map;
  }

}
class PagingInfo {
  PagingInfo({
      num? nextOffset,
      num? limit,}){
    _nextOffset = nextOffset;
    _limit = limit;
}

  PagingInfo.fromJson(dynamic json) {
    _nextOffset = json['nextOffset'];
    _limit = json['limit'];
  }
  num? _nextOffset;
  num? _limit;
PagingInfo copyWith({  num? nextOffset,
  num? limit,
}) => PagingInfo(  nextOffset: nextOffset ?? _nextOffset,
  limit: limit ?? _limit,
);
  num? get nextOffset => _nextOffset;
  num? get limit => _limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nextOffset'] = _nextOffset;
    map['limit'] = _limit;
    return map;
  }

}
class Items {
  Items({
      Data? data, Profile? profile,}){
    _data = data;
}

  Items.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? _data;
Items copyWith({  Data? data,
}) => Items(  data: data ?? _data,
);
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}
class Data {
  Data({
      String? uri,
      String? id,
      String? name,
      AlbumOfTrack? albumOfTrack,
      Artists? artists,
      ContentRating? contentRating,
      MyDuration? duration,
      Playability? playability,}){
    _uri = uri;
    _id = id;
    _name = name;
    _albumOfTrack = albumOfTrack;
    _artists = artists;
    _contentRating = contentRating;
    _duration = duration;
    _playability = playability;
}

  Data.fromJson(dynamic json) {
    _uri = json['uri'];
    _id = json['id'];
    _name = json['name'];
    _albumOfTrack = json['albumOfTrack'] != null ? AlbumOfTrack.fromJson(json['albumOfTrack']) : null;
    _artists = json['artists'] != null ? Artists.fromJson(json['artists']) : null;
    _contentRating = json['contentRating'] != null ? ContentRating.fromJson(json['contentRating']) : null;
    _duration = json['duration'] != null ? MyDuration.fromJson(json['duration']) : null;
    _playability = json['playability'] != null ? Playability.fromJson(json['playability']) : null;
  }
  String? _uri;
  String? _id;
  String? _name;
  AlbumOfTrack? _albumOfTrack;
  Artists? _artists;
  ContentRating? _contentRating;
  MyDuration? _duration;
  Playability? _playability;
Data copyWith({  String? uri,
  String? id,
  String? name,
  AlbumOfTrack? albumOfTrack,
  Artists? artists,
  ContentRating? contentRating,
  MyDuration? duration,
  Playability? playability,
}) => Data(  uri: uri ?? _uri,
  id: id ?? _id,
  name: name ?? _name,
  albumOfTrack: albumOfTrack ?? _albumOfTrack,
  artists: artists ?? _artists,
  contentRating: contentRating ?? _contentRating,
  duration: duration ?? _duration,
  playability: playability ?? _playability,
);
  String? get uri => _uri;
  String? get id => _id;
  String? get name => _name;
  AlbumOfTrack? get albumOfTrack => _albumOfTrack;
  Artists? get artists => _artists;
  ContentRating? get contentRating => _contentRating;
  MyDuration? get duration => _duration;
  Playability? get playability => _playability;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uri'] = _uri;
    map['id'] = _id;
    map['name'] = _name;
    if (_albumOfTrack != null) {
      map['albumOfTrack'] = _albumOfTrack?.toJson();
    }
    if (_artists != null) {
      map['artists'] = _artists?.toJson();
    }
    if (_contentRating != null) {
      map['contentRating'] = _contentRating?.toJson();
    }
    if (_duration != null) {
      map['duration'] = _duration?.toJson();
    }
    if (_playability != null) {
      map['playability'] = _playability?.toJson();
    }
    return map;
  }

}
class Playability {
  Playability({
      bool? playable,}){
    _playable = playable;
}

  Playability.fromJson(dynamic json) {
    _playable = json['playable'];
  }
  bool? _playable;
Playability copyWith({  bool? playable,
}) => Playability(  playable: playable ?? _playable,
);
  bool? get playable => _playable;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['playable'] = _playable;
    return map;
  }

}
class MyDuration {
  MyDuration({
      num? totalMilliseconds,}){
    _totalMilliseconds = totalMilliseconds;
}

  MyDuration.fromJson(dynamic json) {
    _totalMilliseconds = json['totalMilliseconds'];
  }
  num? _totalMilliseconds;
MyDuration copyWith({  num? totalMilliseconds,
}) => MyDuration(  totalMilliseconds: totalMilliseconds ?? _totalMilliseconds,
);
  num? get totalMilliseconds => _totalMilliseconds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalMilliseconds'] = _totalMilliseconds;
    return map;
  }

}
class ContentRating {
  ContentRating({
      String? label,}){
    _label = label;
}

  ContentRating.fromJson(dynamic json) {
    _label = json['label'];
  }
  String? _label;
ContentRating copyWith({  String? label,
}) => ContentRating(  label: label ?? _label,
);
  String? get label => _label;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = _label;
    return map;
  }

}
class Artists {
  Artists({
      List<Items>? items,}){
    _items = items;
}

  Artists.fromJson(dynamic json) {
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
  }
  List<Items>? _items;
Artists copyWith({  List<Items>? items,
}) => Artists(  items: items ?? _items,
);
  List<Items>? get items => _items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
class Profile {
  Profile({
      String? name,}){
    _name = name;
}

  Profile.fromJson(dynamic json) {
    _name = json['name'];
  }
  String? _name;
Profile copyWith({  String? name,
}) => Profile(  name: name ?? _name,
);
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    return map;
  }

}
class AlbumOfTrack {
  AlbumOfTrack({
      String? uri, 
      String? name, 
      CoverArt? coverArt, 
      String? id, 
      SharingInfo? sharingInfo,}){
    _uri = uri;
    _name = name;
    _coverArt = coverArt;
    _id = id;
    _sharingInfo = sharingInfo;
}

  AlbumOfTrack.fromJson(dynamic json) {
    _uri = json['uri'];
    _name = json['name'];
    _coverArt = json['coverArt'] != null ? CoverArt.fromJson(json['coverArt']) : null;
    _id = json['id'];
    _sharingInfo = json['sharingInfo'] != null ? SharingInfo.fromJson(json['sharingInfo']) : null;
  }
  String? _uri;
  String? _name;
  CoverArt? _coverArt;
  String? _id;
  SharingInfo? _sharingInfo;
AlbumOfTrack copyWith({  String? uri,
  String? name,
  CoverArt? coverArt,
  String? id,
  SharingInfo? sharingInfo,
}) => AlbumOfTrack(  uri: uri ?? _uri,
  name: name ?? _name,
  coverArt: coverArt ?? _coverArt,
  id: id ?? _id,
  sharingInfo: sharingInfo ?? _sharingInfo,
);
  String? get uri => _uri;
  String? get name => _name;
  CoverArt? get coverArt => _coverArt;
  String? get id => _id;
  SharingInfo? get sharingInfo => _sharingInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uri'] = _uri;
    map['name'] = _name;
    if (_coverArt != null) {
      map['coverArt'] = _coverArt?.toJson();
    }
    map['id'] = _id;
    if (_sharingInfo != null) {
      map['sharingInfo'] = _sharingInfo?.toJson();
    }
    return map;
  }

}
class SharingInfo {
  SharingInfo({
      String? shareUrl,}){
    _shareUrl = shareUrl;
}

  SharingInfo.fromJson(dynamic json) {
    _shareUrl = json['shareUrl'];
  }
  String? _shareUrl;
SharingInfo copyWith({  String? shareUrl,
}) => SharingInfo(  shareUrl: shareUrl ?? _shareUrl,
);
  String? get shareUrl => _shareUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['shareUrl'] = _shareUrl;
    return map;
  }

}
class CoverArt {
  CoverArt({
      List<Sources>? sources,}){
    _sources = sources;
}

  CoverArt.fromJson(dynamic json) {
    if (json['sources'] != null) {
      _sources = [];
      json['sources'].forEach((v) {
        _sources?.add(Sources.fromJson(v));
      });
    }
  }
  List<Sources>? _sources;
CoverArt copyWith({  List<Sources>? sources,
}) => CoverArt(  sources: sources ?? _sources,
);
  List<Sources>? get sources => _sources;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_sources != null) {
      map['sources'] = _sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
class Sources {
  Sources({
      String? url, 
      num? width, 
      num? height,}){
    _url = url;
    _width = width;
    _height = height;
}

  Sources.fromJson(dynamic json) {
    _url = json['url'];
    _width = json['width'];
    _height = json['height'];
  }
  String? _url;
  num? _width;
  num? _height;
Sources copyWith({  String? url,
  num? width,
  num? height,
}) => Sources(  url: url ?? _url,
  width: width ?? _width,
  height: height ?? _height,
);
  String? get url => _url;
  num? get width => _width;
  num? get height => _height;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['width'] = _width;
    map['height'] = _height;
    return map;
  }

}
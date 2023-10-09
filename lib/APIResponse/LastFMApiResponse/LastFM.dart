class LastFm {
  LastFm({
    Results? results,
  }) : _results = results;

  factory LastFm.fromJson(Map<String, dynamic> json) {
    return LastFm(
      results: json['results'] != null ? Results.fromJson(json['results']) : null,
    );
  }

  final Results? _results;

  Results? get results => _results;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    if (_results != null) {
      map['results'] = _results!.toJson();
    }
    return map;
  }
}

class Results {
  Results({
    OpensearchQuery? opensearchQuery,
    String? opensearchTotalResults,
    String? opensearchStartIndex,
    String? opensearchItemsPerPage,
    Trackmatches? trackmatches,
    dynamic attr,
  })  : _opensearchQuery = opensearchQuery,
        _opensearchTotalResults = opensearchTotalResults,
        _opensearchStartIndex = opensearchStartIndex,
        _opensearchItemsPerPage = opensearchItemsPerPage,
        _trackmatches = trackmatches,
        _attr = attr;

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      opensearchQuery: json['opensearch:Query'] != null
          ? OpensearchQuery.fromJson(json['opensearch:Query'])
          : null,
      opensearchTotalResults: json['opensearch:totalResults'],
      opensearchStartIndex: json['opensearch:startIndex'],
      opensearchItemsPerPage: json['opensearch:itemsPerPage'],
      trackmatches: json['trackmatches'] != null
          ? Trackmatches.fromJson(json['trackmatches'])
          : null,
      attr: json['@attr'],
    );
  }

  final OpensearchQuery? _opensearchQuery;
  final String? _opensearchTotalResults;
  final String? _opensearchStartIndex;
  final String? _opensearchItemsPerPage;
  final Trackmatches? _trackmatches;
  final dynamic _attr;

  OpensearchQuery? get opensearchQuery => _opensearchQuery;
  String? get opensearchTotalResults => _opensearchTotalResults;
  String? get opensearchStartIndex => _opensearchStartIndex;
  String? get opensearchItemsPerPage => _opensearchItemsPerPage;
  Trackmatches? get trackmatches => _trackmatches;
  dynamic get attr => _attr;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    if (_opensearchQuery != null) {
      map['opensearch:Query'] = _opensearchQuery!.toJson();
    }
    map['opensearch:totalResults'] = _opensearchTotalResults;
    map['opensearch:startIndex'] = _opensearchStartIndex;
    map['opensearch:itemsPerPage'] = _opensearchItemsPerPage;
    if (_trackmatches != null) {
      map['trackmatches'] = _trackmatches!.toJson();
    }
    map['@attr'] = _attr;
    return map;
  }
}

class OpensearchQuery {
  OpensearchQuery({
    String? text,
    String? role,
    String? startPage,
  })  : _text = text,
        _role = role,
        _startPage = startPage;

  factory OpensearchQuery.fromJson(Map<String, dynamic> json) {
    return OpensearchQuery(
      text: json['#text'],
      role: json['role'],
      startPage: json['startPage'],
    );
  }

  final String? _text;
  final String? _role;
  final String? _startPage;

  String? get text => _text;
  String? get role => _role;
  String? get startPage => _startPage;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['#text'] = _text;
    map['role'] = _role;
    map['startPage'] = _startPage;
    return map;
  }
}

class Trackmatches {
  Trackmatches({
    List<Track>? track,
  }) : _track = track;

  factory Trackmatches.fromJson(Map<String, dynamic> json) {
    final List<dynamic> trackList = json['track'];
    final List<Track> tracks = trackList
        .map((dynamic trackJson) => Track.fromJson(trackJson))
        .toList();

    return Trackmatches(track: tracks);
  }

  final List<Track>? _track;

  List<Track>? get track => _track;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    if (_track != null) {
      map['track'] = _track!.map((Track track) => track.toJson()).toList();
    }
    return map;
  }
}

class Track {
  Track({
    String? name,
    String? artist,
    String? url,
    String? streamable,
    String? listeners,
    List<MyImage>? image,
    String? mbid,
  })  : _name = name,
        _artist = artist,
        _url = url,
        _streamable = streamable,
        _listeners = listeners,
        _image = image,
        _mbid = mbid;

  factory Track.fromJson(Map<String, dynamic> json) {
    final List<dynamic> imageList = json['image'];
    final List<MyImage> images = imageList
        .map((dynamic imageJson) => MyImage.fromJson(imageJson))
        .toList();

    return Track(
      name: json['name'],
      artist: json['artist'],
      url: json['url'],
      streamable: json['streamable'],
      listeners: json['listeners'],
      image: images,
      mbid: json['mbid'],
    );
  }

  final String? _name;
  final String? _artist;
  final String? _url;
  final String? _streamable;
  final String? _listeners;
  final List<MyImage>? _image;
  final String? _mbid;

  String? get name => _name;
  String? get artist => _artist;
  String? get url => _url;
  String? get streamable => _streamable;
  String? get listeners => _listeners;
  List<MyImage>? get image => _image;
  String? get mbid => _mbid;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['name'] = _name;
    map['artist'] = _artist;
    map['url'] = _url;
    map['streamable'] = _streamable;
    map['listeners'] = _listeners;
    if (_image != null) {
      map['image'] = _image!.map((MyImage image) => image.toJson()).toList();
    }
    map['mbid'] = _mbid;
    return map;
  }
}

class MyImage {
  MyImage({
    String? text,
    String? size,
  })  : _text = text,
        _size = size;

  factory MyImage.fromJson(Map<String, dynamic> json) {
    return MyImage(
      text: json['#text'],
      size: json['size'],
    );
  }

  final String? _text;
  final String? _size;

  String? get text => _text;
  String? get size => _size;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['#text'] = _text;
    map['size'] = _size;
    return map;
  }
}

import 'Artists.dart';
import 'ExternalUrls.dart';
import 'Images.dart';
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

  Album.fromJson(Map<String,dynamic> json) {
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
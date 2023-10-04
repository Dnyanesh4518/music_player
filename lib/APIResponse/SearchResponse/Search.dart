class Search {
  Search({
      List<Data>? data, 
      num? total, 
      String? next,}){
    _data = data;
    _total = total;
    _next = next;
}

  Search.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _total = json['total'];
    _next = json['next'];
  }
  List<Data>? _data;
  num? _total;
  String? _next;
Search copyWith({  List<Data>? data,
  num? total,
  String? next,
}) => Search(  data: data ?? _data,
  total: total ?? _total,
  next: next ?? _next,
);
  List<Data>? get data => _data;
  num? get total => _total;
  String? get next => _next;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['total'] = _total;
    map['next'] = _next;
    return map;
  }

}
class Data {
  Data({
      num? id, 
      bool? readable, 
      String? title, 
      String? titleShort, 
      String? titleVersion, 
      String? link, 
      num? duration, 
      num? rank, 
      bool? explicitLyrics, 
      num? explicitContentLyrics, 
      num? explicitContentCover, 
      String? preview, 
      String? md5Image, 
      Artist? artist, 
      Album? album, 
      String? type,}){
    _id = id;
    _readable = readable;
    _title = title;
    _titleShort = titleShort;
    _titleVersion = titleVersion;
    _link = link;
    _duration = duration;
    _rank = rank;
    _explicitLyrics = explicitLyrics;
    _explicitContentLyrics = explicitContentLyrics;
    _explicitContentCover = explicitContentCover;
    _preview = preview;
    _md5Image = md5Image;
    _artist = artist;
    _album = album;
    _type = type;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _readable = json['readable'];
    _title = json['title'];
    _titleShort = json['title_short'];
    _titleVersion = json['title_version'];
    _link = json['link'];
    _duration = json['duration'];
    _rank = json['rank'];
    _explicitLyrics = json['explicit_lyrics'];
    _explicitContentLyrics = json['explicit_content_lyrics'];
    _explicitContentCover = json['explicit_content_cover'];
    _preview = json['preview'];
    _md5Image = json['md5_image'];
    _artist = json['artist'] != null ? Artist.fromJson(json['artist']) : null;
    _album = json['album'] != null ? Album.fromJson(json['album']) : null;
    _type = json['type'];
  }
  num? _id;
  bool? _readable;
  String? _title;
  String? _titleShort;
  String? _titleVersion;
  String? _link;
  num? _duration;
  num? _rank;
  bool? _explicitLyrics;
  num? _explicitContentLyrics;
  num? _explicitContentCover;
  String? _preview;
  String? _md5Image;
  Artist? _artist;
  Album? _album;
  String? _type;
Data copyWith({  num? id,
  bool? readable,
  String? title,
  String? titleShort,
  String? titleVersion,
  String? link,
  num? duration,
  num? rank,
  bool? explicitLyrics,
  num? explicitContentLyrics,
  num? explicitContentCover,
  String? preview,
  String? md5Image,
  Artist? artist,
  Album? album,
  String? type,
}) => Data(  id: id ?? _id,
  readable: readable ?? _readable,
  title: title ?? _title,
  titleShort: titleShort ?? _titleShort,
  titleVersion: titleVersion ?? _titleVersion,
  link: link ?? _link,
  duration: duration ?? _duration,
  rank: rank ?? _rank,
  explicitLyrics: explicitLyrics ?? _explicitLyrics,
  explicitContentLyrics: explicitContentLyrics ?? _explicitContentLyrics,
  explicitContentCover: explicitContentCover ?? _explicitContentCover,
  preview: preview ?? _preview,
  md5Image: md5Image ?? _md5Image,
  artist: artist ?? _artist,
  album: album ?? _album,
  type: type ?? _type,
);
  num? get id => _id;
  bool? get readable => _readable;
  String? get title => _title;
  String? get titleShort => _titleShort;
  String? get titleVersion => _titleVersion;
  String? get link => _link;
  num? get duration => _duration;
  num? get rank => _rank;
  bool? get explicitLyrics => _explicitLyrics;
  num? get explicitContentLyrics => _explicitContentLyrics;
  num? get explicitContentCover => _explicitContentCover;
  String? get preview => _preview;
  String? get md5Image => _md5Image;
  Artist? get artist => _artist;
  Album? get album => _album;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['readable'] = _readable;
    map['title'] = _title;
    map['title_short'] = _titleShort;
    map['title_version'] = _titleVersion;
    map['link'] = _link;
    map['duration'] = _duration;
    map['rank'] = _rank;
    map['explicit_lyrics'] = _explicitLyrics;
    map['explicit_content_lyrics'] = _explicitContentLyrics;
    map['explicit_content_cover'] = _explicitContentCover;
    map['preview'] = _preview;
    map['md5_image'] = _md5Image;
    if (_artist != null) {
      map['artist'] = _artist?.toJson();
    }
    if (_album != null) {
      map['album'] = _album?.toJson();
    }
    map['type'] = _type;
    return map;
  }

}
class Album {
  Album({
      num? id, 
      String? title, 
      String? cover, 
      String? coverSmall, 
      String? coverMedium, 
      String? coverBig, 
      String? coverXl, 
      String? md5Image, 
      String? tracklist, 
      String? type,}){
    _id = id;
    _title = title;
    _cover = cover;
    _coverSmall = coverSmall;
    _coverMedium = coverMedium;
    _coverBig = coverBig;
    _coverXl = coverXl;
    _md5Image = md5Image;
    _tracklist = tracklist;
    _type = type;
}

  Album.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _cover = json['cover'];
    _coverSmall = json['cover_small'];
    _coverMedium = json['cover_medium'];
    _coverBig = json['cover_big'];
    _coverXl = json['cover_xl'];
    _md5Image = json['md5_image'];
    _tracklist = json['tracklist'];
    _type = json['type'];
  }
  num? _id;
  String? _title;
  String? _cover;
  String? _coverSmall;
  String? _coverMedium;
  String? _coverBig;
  String? _coverXl;
  String? _md5Image;
  String? _tracklist;
  String? _type;
Album copyWith({  num? id,
  String? title,
  String? cover,
  String? coverSmall,
  String? coverMedium,
  String? coverBig,
  String? coverXl,
  String? md5Image,
  String? tracklist,
  String? type,
}) => Album(  id: id ?? _id,
  title: title ?? _title,
  cover: cover ?? _cover,
  coverSmall: coverSmall ?? _coverSmall,
  coverMedium: coverMedium ?? _coverMedium,
  coverBig: coverBig ?? _coverBig,
  coverXl: coverXl ?? _coverXl,
  md5Image: md5Image ?? _md5Image,
  tracklist: tracklist ?? _tracklist,
  type: type ?? _type,
);
  num? get id => _id;
  String? get title => _title;
  String? get cover => _cover;
  String? get coverSmall => _coverSmall;
  String? get coverMedium => _coverMedium;
  String? get coverBig => _coverBig;
  String? get coverXl => _coverXl;
  String? get md5Image => _md5Image;
  String? get tracklist => _tracklist;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['cover'] = _cover;
    map['cover_small'] = _coverSmall;
    map['cover_medium'] = _coverMedium;
    map['cover_big'] = _coverBig;
    map['cover_xl'] = _coverXl;
    map['md5_image'] = _md5Image;
    map['tracklist'] = _tracklist;
    map['type'] = _type;
    return map;
  }

}
class Artist {
  Artist({
      num? id, 
      String? name, 
      String? link, 
      String? picture, 
      String? pictureSmall, 
      String? pictureMedium, 
      String? pictureBig, 
      String? pictureXl, 
      String? tracklist, 
      String? type,}){
    _id = id;
    _name = name;
    _link = link;
    _picture = picture;
    _pictureSmall = pictureSmall;
    _pictureMedium = pictureMedium;
    _pictureBig = pictureBig;
    _pictureXl = pictureXl;
    _tracklist = tracklist;
    _type = type;
}

  Artist.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _link = json['link'];
    _picture = json['picture'];
    _pictureSmall = json['picture_small'];
    _pictureMedium = json['picture_medium'];
    _pictureBig = json['picture_big'];
    _pictureXl = json['picture_xl'];
    _tracklist = json['tracklist'];
    _type = json['type'];
  }
  num? _id;
  String? _name;
  String? _link;
  String? _picture;
  String? _pictureSmall;
  String? _pictureMedium;
  String? _pictureBig;
  String? _pictureXl;
  String? _tracklist;
  String? _type;
Artist copyWith({  num? id,
  String? name,
  String? link,
  String? picture,
  String? pictureSmall,
  String? pictureMedium,
  String? pictureBig,
  String? pictureXl,
  String? tracklist,
  String? type,
}) => Artist(  id: id ?? _id,
  name: name ?? _name,
  link: link ?? _link,
  picture: picture ?? _picture,
  pictureSmall: pictureSmall ?? _pictureSmall,
  pictureMedium: pictureMedium ?? _pictureMedium,
  pictureBig: pictureBig ?? _pictureBig,
  pictureXl: pictureXl ?? _pictureXl,
  tracklist: tracklist ?? _tracklist,
  type: type ?? _type,
);
  num? get id => _id;
  String? get name => _name;
  String? get link => _link;
  String? get picture => _picture;
  String? get pictureSmall => _pictureSmall;
  String? get pictureMedium => _pictureMedium;
  String? get pictureBig => _pictureBig;
  String? get pictureXl => _pictureXl;
  String? get tracklist => _tracklist;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['link'] = _link;
    map['picture'] = _picture;
    map['picture_small'] = _pictureSmall;
    map['picture_medium'] = _pictureMedium;
    map['picture_big'] = _pictureBig;
    map['picture_xl'] = _pictureXl;
    map['tracklist'] = _tracklist;
    map['type'] = _type;
    return map;
  }

}
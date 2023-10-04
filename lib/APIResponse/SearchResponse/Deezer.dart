class Deezer {
  Deezer({
    num? id,
    bool? readable,
    String? title,
    String? titleShort,
    String? titleVersion,
    String? isrc,
    String? link,
    String? share,
    num? duration,
    num? trackPosition,
    num? diskNumber,
    num? rank,
    String? releaseDate,
    bool? explicitLyrics,
    num? explicitContentLyrics,
    num? explicitContentCover,
    String? preview,
    num? bpm,
    num? gain,
    List<String>? availableCountries,
    List<Contributors>? contributors,
    String? md5Image,
    Artist? artist,
    Album? album,
    String? type,}){
    _id = id;
    _readable = readable;
    _title = title;
    _titleShort = titleShort;
    _titleVersion = titleVersion;
    _isrc = isrc;
    _link = link;
    _share = share;
    _duration = duration;
    _trackPosition = trackPosition;
    _diskNumber = diskNumber;
    _rank = rank;
    _releaseDate = releaseDate;
    _explicitLyrics = explicitLyrics;
    _explicitContentLyrics = explicitContentLyrics;
    _explicitContentCover = explicitContentCover;
    _preview = preview;
    _bpm = bpm;
    _gain = gain;
    _availableCountries = availableCountries;
    _contributors = contributors;
    _md5Image = md5Image;
    _artist = artist;
    _album = album;
    _type = type;
  }

  Deezer.fromJson(Map<String,dynamic> json) {
    _id = json['id'];
    _readable = json['readable'];
    _title = json['title'];
    _titleShort = json['title_short'];
    _titleVersion = json['title_version'];
    _isrc = json['isrc'];
    _link = json['link'];
    _share = json['share'];
    _duration = json['duration'];
    _trackPosition = json['track_position'];
    _diskNumber = json['disk_number'];
    _rank = json['rank'];
    _releaseDate = json['release_date'];
    _explicitLyrics = json['explicit_lyrics'];
    _explicitContentLyrics = json['explicit_content_lyrics'];
    _explicitContentCover = json['explicit_content_cover'];
    _preview = json['preview'];
    _bpm = json['bpm'];
    _gain = json['gain'];
    _availableCountries = json['available_countries'] != null ? json['available_countries'].cast<String>() : [];
    if (json['contributors'] != null) {
      _contributors = [];
      json['contributors'].forEach((v) {
        _contributors?.add(Contributors.fromJson(v));
      });
    }
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
  String? _isrc;
  String? _link;
  String? _share;
  num? _duration;
  num? _trackPosition;
  num? _diskNumber;
  num? _rank;
  String? _releaseDate;
  bool? _explicitLyrics;
  num? _explicitContentLyrics;
  num? _explicitContentCover;
  String? _preview;
  num? _bpm;
  num? _gain;
  List<String>? _availableCountries;
  List<Contributors>? _contributors;
  String? _md5Image;
  Artist? _artist;
  Album? _album;
  String? _type;
  Deezer copyWith({  num? id,
    bool? readable,
    String? title,
    String? titleShort,
    String? titleVersion,
    String? isrc,
    String? link,
    String? share,
    num? duration,
    num? trackPosition,
    num? diskNumber,
    num? rank,
    String? releaseDate,
    bool? explicitLyrics,
    num? explicitContentLyrics,
    num? explicitContentCover,
    String? preview,
    num? bpm,
    num? gain,
    List<String>? availableCountries,
    List<Contributors>? contributors,
    String? md5Image,
    Artist? artist,
    Album? album,
    String? type,
  }) => Deezer(  id: id ?? _id,
    readable: readable ?? _readable,
    title: title ?? _title,
    titleShort: titleShort ?? _titleShort,
    titleVersion: titleVersion ?? _titleVersion,
    isrc: isrc ?? _isrc,
    link: link ?? _link,
    share: share ?? _share,
    duration: duration ?? _duration,
    trackPosition: trackPosition ?? _trackPosition,
    diskNumber: diskNumber ?? _diskNumber,
    rank: rank ?? _rank,
    releaseDate: releaseDate ?? _releaseDate,
    explicitLyrics: explicitLyrics ?? _explicitLyrics,
    explicitContentLyrics: explicitContentLyrics ?? _explicitContentLyrics,
    explicitContentCover: explicitContentCover ?? _explicitContentCover,
    preview: preview ?? _preview,
    bpm: bpm ?? _bpm,
    gain: gain ?? _gain,
    availableCountries: availableCountries ?? _availableCountries,
    contributors: contributors ?? _contributors,
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
  String? get isrc => _isrc;
  String? get link => _link;
  String? get share => _share;
  num? get duration => _duration;
  num? get trackPosition => _trackPosition;
  num? get diskNumber => _diskNumber;
  num? get rank => _rank;
  String? get releaseDate => _releaseDate;
  bool? get explicitLyrics => _explicitLyrics;
  num? get explicitContentLyrics => _explicitContentLyrics;
  num? get explicitContentCover => _explicitContentCover;
  String? get preview => _preview;
  num? get bpm => _bpm;
  num? get gain => _gain;
  List<String>? get availableCountries => _availableCountries;
  List<Contributors>? get contributors => _contributors;
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
    map['isrc'] = _isrc;
    map['link'] = _link;
    map['share'] = _share;
    map['duration'] = _duration;
    map['track_position'] = _trackPosition;
    map['disk_number'] = _diskNumber;
    map['rank'] = _rank;
    map['release_date'] = _releaseDate;
    map['explicit_lyrics'] = _explicitLyrics;
    map['explicit_content_lyrics'] = _explicitContentLyrics;
    map['explicit_content_cover'] = _explicitContentCover;
    map['preview'] = _preview;
    map['bpm'] = _bpm;
    map['gain'] = _gain;
    map['available_countries'] = _availableCountries;
    if (_contributors != null) {
      map['contributors'] = _contributors?.map((v) => v.toJson()).toList();
    }
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
    String? link,
    String? cover,
    String? coverSmall,
    String? coverMedium,
    String? coverBig,
    String? coverXl,
    String? md5Image,
    String? releaseDate,
    String? tracklist,
    String? type,}){
    _id = id;
    _title = title;
    _link = link;
    _cover = cover;
    _coverSmall = coverSmall;
    _coverMedium = coverMedium;
    _coverBig = coverBig;
    _coverXl = coverXl;
    _md5Image = md5Image;
    _releaseDate = releaseDate;
    _tracklist = tracklist;
    _type = type;
  }

  Album.fromJson(Map<String,dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _link = json['link'];
    _cover = json['cover'];
    _coverSmall = json['cover_small'];
    _coverMedium = json['cover_medium'];
    _coverBig = json['cover_big'];
    _coverXl = json['cover_xl'];
    _md5Image = json['md5_image'];
    _releaseDate = json['release_date'];
    _tracklist = json['tracklist'];
    _type = json['type'];
  }
  num? _id;
  String? _title;
  String? _link;
  String? _cover;
  String? _coverSmall;
  String? _coverMedium;
  String? _coverBig;
  String? _coverXl;
  String? _md5Image;
  String? _releaseDate;
  String? _tracklist;
  String? _type;
  Album copyWith({  num? id,
    String? title,
    String? link,
    String? cover,
    String? coverSmall,
    String? coverMedium,
    String? coverBig,
    String? coverXl,
    String? md5Image,
    String? releaseDate,
    String? tracklist,
    String? type,
  }) => Album(  id: id ?? _id,
    title: title ?? _title,
    link: link ?? _link,
    cover: cover ?? _cover,
    coverSmall: coverSmall ?? _coverSmall,
    coverMedium: coverMedium ?? _coverMedium,
    coverBig: coverBig ?? _coverBig,
    coverXl: coverXl ?? _coverXl,
    md5Image: md5Image ?? _md5Image,
    releaseDate: releaseDate ?? _releaseDate,
    tracklist: tracklist ?? _tracklist,
    type: type ?? _type,
  );
  num? get id => _id;
  String? get title => _title;
  String? get link => _link;
  String? get cover => _cover;
  String? get coverSmall => _coverSmall;
  String? get coverMedium => _coverMedium;
  String? get coverBig => _coverBig;
  String? get coverXl => _coverXl;
  String? get md5Image => _md5Image;
  String? get releaseDate => _releaseDate;
  String? get tracklist => _tracklist;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['link'] = _link;
    map['cover'] = _cover;
    map['cover_small'] = _coverSmall;
    map['cover_medium'] = _coverMedium;
    map['cover_big'] = _coverBig;
    map['cover_xl'] = _coverXl;
    map['md5_image'] = _md5Image;
    map['release_date'] = _releaseDate;
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
    String? share,
    String? picture,
    String? pictureSmall,
    String? pictureMedium,
    String? pictureBig,
    String? pictureXl,
    bool? radio,
    String? tracklist,
    String? type,}){
    _id = id;
    _name = name;
    _link = link;
    _share = share;
    _picture = picture;
    _pictureSmall = pictureSmall;
    _pictureMedium = pictureMedium;
    _pictureBig = pictureBig;
    _pictureXl = pictureXl;
    _radio = radio;
    _tracklist = tracklist;
    _type = type;
  }

  Artist.fromJson(Map<String,dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _link = json['link'];
    _share = json['share'];
    _picture = json['picture'];
    _pictureSmall = json['picture_small'];
    _pictureMedium = json['picture_medium'];
    _pictureBig = json['picture_big'];
    _pictureXl = json['picture_xl'];
    _radio = json['radio'];
    _tracklist = json['tracklist'];
    _type = json['type'];
  }
  num? _id;
  String? _name;
  String? _link;
  String? _share;
  String? _picture;
  String? _pictureSmall;
  String? _pictureMedium;
  String? _pictureBig;
  String? _pictureXl;
  bool? _radio;
  String? _tracklist;
  String? _type;
  Artist copyWith({  num? id,
    String? name,
    String? link,
    String? share,
    String? picture,
    String? pictureSmall,
    String? pictureMedium,
    String? pictureBig,
    String? pictureXl,
    bool? radio,
    String? tracklist,
    String? type,
  }) => Artist(  id: id ?? _id,
    name: name ?? _name,
    link: link ?? _link,
    share: share ?? _share,
    picture: picture ?? _picture,
    pictureSmall: pictureSmall ?? _pictureSmall,
    pictureMedium: pictureMedium ?? _pictureMedium,
    pictureBig: pictureBig ?? _pictureBig,
    pictureXl: pictureXl ?? _pictureXl,
    radio: radio ?? _radio,
    tracklist: tracklist ?? _tracklist,
    type: type ?? _type,
  );
  num? get id => _id;
  String? get name => _name;
  String? get link => _link;
  String? get share => _share;
  String? get picture => _picture;
  String? get pictureSmall => _pictureSmall;
  String? get pictureMedium => _pictureMedium;
  String? get pictureBig => _pictureBig;
  String? get pictureXl => _pictureXl;
  bool? get radio => _radio;
  String? get tracklist => _tracklist;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['link'] = _link;
    map['share'] = _share;
    map['picture'] = _picture;
    map['picture_small'] = _pictureSmall;
    map['picture_medium'] = _pictureMedium;
    map['picture_big'] = _pictureBig;
    map['picture_xl'] = _pictureXl;
    map['radio'] = _radio;
    map['tracklist'] = _tracklist;
    map['type'] = _type;
    return map;
  }

}
class Contributors {
  Contributors({
    num? id,
    String? name,
    String? link,
    String? share,
    String? picture,
    String? pictureSmall,
    String? pictureMedium,
    String? pictureBig,
    String? pictureXl,
    bool? radio,
    String? tracklist,
    String? type,
    String? role,}){
    _id = id;
    _name = name;
    _link = link;
    _share = share;
    _picture = picture;
    _pictureSmall = pictureSmall;
    _pictureMedium = pictureMedium;
    _pictureBig = pictureBig;
    _pictureXl = pictureXl;
    _radio = radio;
    _tracklist = tracklist;
    _type = type;
    _role = role;
  }

  Contributors.fromJson(Map<String,dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _link = json['link'];
    _share = json['share'];
    _picture = json['picture'];
    _pictureSmall = json['picture_small'];
    _pictureMedium = json['picture_medium'];
    _pictureBig = json['picture_big'];
    _pictureXl = json['picture_xl'];
    _radio = json['radio'];
    _tracklist = json['tracklist'];
    _type = json['type'];
    _role = json['role'];
  }
  num? _id;
  String? _name;
  String? _link;
  String? _share;
  String? _picture;
  String? _pictureSmall;
  String? _pictureMedium;
  String? _pictureBig;
  String? _pictureXl;
  bool? _radio;
  String? _tracklist;
  String? _type;
  String? _role;
  Contributors copyWith({  num? id,
    String? name,
    String? link,
    String? share,
    String? picture,
    String? pictureSmall,
    String? pictureMedium,
    String? pictureBig,
    String? pictureXl,
    bool? radio,
    String? tracklist,
    String? type,
    String? role,
  }) => Contributors(  id: id ?? _id,
    name: name ?? _name,
    link: link ?? _link,
    share: share ?? _share,
    picture: picture ?? _picture,
    pictureSmall: pictureSmall ?? _pictureSmall,
    pictureMedium: pictureMedium ?? _pictureMedium,
    pictureBig: pictureBig ?? _pictureBig,
    pictureXl: pictureXl ?? _pictureXl,
    radio: radio ?? _radio,
    tracklist: tracklist ?? _tracklist,
    type: type ?? _type,
    role: role ?? _role,
  );
  num? get id => _id;
  String? get name => _name;
  String? get link => _link;
  String? get share => _share;
  String? get picture => _picture;
  String? get pictureSmall => _pictureSmall;
  String? get pictureMedium => _pictureMedium;
  String? get pictureBig => _pictureBig;
  String? get pictureXl => _pictureXl;
  bool? get radio => _radio;
  String? get tracklist => _tracklist;
  String? get type => _type;
  String? get role => _role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['link'] = _link;
    map['share'] = _share;
    map['picture'] = _picture;
    map['picture_small'] = _pictureSmall;
    map['picture_medium'] = _pictureMedium;
    map['picture_big'] = _pictureBig;
    map['picture_xl'] = _pictureXl;
    map['radio'] = _radio;
    map['tracklist'] = _tracklist;
    map['type'] = _type;
    map['role'] = _role;
    return map;
  }

}

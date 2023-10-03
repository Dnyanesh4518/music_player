import 'Items.dart';

class Main {
  Main({
      List<Items>? items, 
      num? limit, 
      dynamic next, 
      num? offset, 
      dynamic previous, 
      num? total,}){
    _items = items;
    _limit = limit;
    _next = next;
    _offset = offset;
    _previous = previous;
    _total = total;
}

  Main.fromJson(Map<String,dynamic> json) {
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
    _limit = json['limit'];
    _next = json['next'];
    _offset = json['offset'];
    _previous = json['previous'];
    _total = json['total'];
  }
  List<Items>? _items;
  num? _limit;
  dynamic _next;
  num? _offset;
  dynamic _previous;
  num? _total;
Main copyWith({  List<Items>? items,
  num? limit,
  dynamic next,
  num? offset,
  dynamic previous,
  num? total,
}) => Main(  items: items ?? _items,
  limit: limit ?? _limit,
  next: next ?? _next,
  offset: offset ?? _offset,
  previous: previous ?? _previous,
  total: total ?? _total,
);
  List<Items>? get items => _items;
  num? get limit => _limit;
  dynamic get next => _next;
  num? get offset => _offset;
  dynamic get previous => _previous;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    map['limit'] = _limit;
    map['next'] = _next;
    map['offset'] = _offset;
    map['previous'] = _previous;
    map['total'] = _total;
    return map;
  }

}


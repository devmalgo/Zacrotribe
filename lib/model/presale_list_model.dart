class PresaleListModel {
  bool? _status;
  String? _message;
  List<Data>? _data;
  int? _count;

  PresaleListModel(
      {bool? status, String? message, List<Data>? data, int? count}) {
    if (status != null) {
      this._status = status;
    }
    if (message != null) {
      this._message = message;
    }
    if (data != null) {
      this._data = data;
    }
    if (count != null) {
      this._count = count;
    }
  }

  bool? get status => _status;
  set status(bool? status) => _status = status;
  String? get message => _message;
  set message(String? message) => _message = message;
  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;
  int? get count => _count;
  set count(int? count) => _count = count;

  PresaleListModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
    _count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    data['count'] = this._count;
    return data;
  }
}

class Data {
  String? _sId;
  String? _image;
  String? _name;
  String? _presaleLink;
  String? _category;
  String? _content;
  String? _facebook;
  String? _telegram;
  String? _discord;
  String? _createdAt;
  String? _updatedAt;

  Data(
      {String? sId,
        String? image,
        String? name,
        String? presaleLink,
        String? category,
        String? content,
        String? facebook,
        String? telegram,
        String? discord,
        String? createdAt,
        String? updatedAt}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (image != null) {
      this._image = image;
    }
    if (name != null) {
      this._name = name;
    }
    if (presaleLink != null) {
      this._presaleLink = presaleLink;
    }
    if (category != null) {
      this._category = category;
    }
    if (content != null) {
      this._content = content;
    }
    if (facebook != null) {
      this._facebook = facebook;
    }
    if (telegram != null) {
      this._telegram = telegram;
    }
    if (discord != null) {
      this._discord = discord;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get presaleLink => _presaleLink;
  set presaleLink(String? presaleLink) => _presaleLink = presaleLink;
  String? get category => _category;
  set category(String? category) => _category = category;
  String? get content => _content;
  set content(String? content) => _content = content;
  String? get facebook => _facebook;
  set facebook(String? facebook) => _facebook = facebook;
  String? get telegram => _telegram;
  set telegram(String? telegram) => _telegram = telegram;
  String? get discord => _discord;
  set discord(String? discord) => _discord = discord;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Data.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _image = json['image'];
    _name = json['name'];
    _presaleLink = json['presaleLink'];
    _category = json['category'];
    _content = json['content'];
    _facebook = json['facebook'];
    _telegram = json['telegram'];
    _discord = json['discord'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['image'] = this._image;
    data['name'] = this._name;
    data['presaleLink'] = this._presaleLink;
    data['category'] = this._category;
    data['content'] = this._content;
    data['facebook'] = this._facebook;
    data['telegram'] = this._telegram;
    data['discord'] = this._discord;
    data['createdAt'] = this._createdAt;
    data['updatedAt'] = this._updatedAt;
    return data;
  }
}

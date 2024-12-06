class AirdropListModel {
  bool? _status;
  String? _message;
  List<Data>? _data;
  int? _count;

  AirdropListModel({bool? status, String? message, List<Data>? data, int? count}) {
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

  AirdropListModel.fromJson(Map<String, dynamic> json) {
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
  String? _airdropLink;
  String? _platform;
  String? _content;
  String? _category;
  int? _totalValue;
  String? _createdAt;
  String? _updatedAt;

  Data(
      {String? sId,
        String? image,
        String? name,
        String? airdropLink,
        String? platform,
        String? content,
        String? category,
        int? totalValue,
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
    if (airdropLink != null) {
      this._airdropLink = airdropLink;
    }
    if (platform != null) {
      this._platform = platform;
    }
    if (content != null) {
      this._content = content;
    }
    if (category != null) {
      this._category = category;
    }
    if (totalValue != null) {
      this._totalValue = totalValue;
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
  String? get airdropLink => _airdropLink;
  set airdropLink(String? airdropLink) => _airdropLink = airdropLink;
  String? get platform => _platform;
  set platform(String? platform) => _platform = platform;
  String? get content => _content;
  set content(String? content) => _content = content;
  String? get category => _category;
  set category(String? category) => _category = category;
  int? get totalValue => _totalValue;
  set totalValue(int? totalValue) => _totalValue = totalValue;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Data.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _image = json['image'];
    _name = json['name'];
    _airdropLink = json['airdropLink'];
    _platform = json['platform'];
    _content = json['content'];
    _category = json['category'];
    _totalValue = json['totalValue'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['image'] = this._image;
    data['name'] = this._name;
    data['airdropLink'] = this._airdropLink;
    data['platform'] = this._platform;
    data['content'] = this._content;
    data['category'] = this._category;
    data['totalValue'] = this._totalValue;
    data['createdAt'] = this._createdAt;
    data['updatedAt'] = this._updatedAt;
    return data;
  }
}

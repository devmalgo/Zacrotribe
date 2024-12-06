class AirdropModel {
  bool? _status;
  String? _message;
  Data? _data;

  AirdropModel({bool? status, String? message, Data? data}) {
    if (status != null) {
      this._status = status;
    }
    if (message != null) {
      this._message = message;
    }
    if (data != null) {
      this._data = data;
    }
  }

  bool? get status => _status;
  set status(bool? status) => _status = status;
  String? get message => _message;
  set message(String? message) => _message = message;
  Data? get data => _data;
  set data(Data? data) => _data = data;

  AirdropModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
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

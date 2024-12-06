class CategoryModel {
  bool? _status;
  String? _message;
  List<Data>? _data;
  int? _count;

  CategoryModel({bool? status, String? message, List<Data>? data, int? count}) {
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

  CategoryModel.fromJson(Map<String, dynamic> json) {
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
  String? _category;
  String? _image;
  String? _status;
  String? _type;

  Data(
      {String? sId,
        String? category,
        String? image,
        String? status,
        String? type}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (category != null) {
      this._category = category;
    }
    if (image != null) {
      this._image = image;
    }
    if (status != null) {
      this._status = status;
    }
    if (type != null) {
      this._type = type;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get category => _category;
  set category(String? category) => _category = category;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get type => _type;
  set type(String? type) => _type = type;

  Data.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _category = json['category'];
    _image = json['image'];
    _status = json['status'];
    _type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['category'] = this._category;
    data['image'] = this._image;
    data['status'] = this._status;
    data['type'] = this._type;
    return data;
  }
}

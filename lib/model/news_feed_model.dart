class NewsFeedModel {
  bool? _status;
  String? _message;
  Data? _data;

  NewsFeedModel({bool? status, String? message, Data? data}) {
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

  NewsFeedModel.fromJson(Map<String, dynamic> json) {
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
  String? _title;
  int? _iV;
  String? _category;
  String? _content;
  String? _createdAt;
  String? _creator;
  String? _description;
  String? _image;
  int? _likeCount;
  String? _link;
  String? _pubDate;
  String? _updatedAt;

  Data(
      {String? sId,
        String? title,
        int? iV,
        String? category,
        String? content,
        String? createdAt,
        String? creator,
        String? description,
        String? image,
        int? likeCount,
        String? link,
        String? pubDate,
        String? updatedAt}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (title != null) {
      this._title = title;
    }
    if (iV != null) {
      this._iV = iV;
    }
    if (category != null) {
      this._category = category;
    }
    if (content != null) {
      this._content = content;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (creator != null) {
      this._creator = creator;
    }
    if (description != null) {
      this._description = description;
    }
    if (image != null) {
      this._image = image;
    }
    if (likeCount != null) {
      this._likeCount = likeCount;
    }
    if (link != null) {
      this._link = link;
    }
    if (pubDate != null) {
      this._pubDate = pubDate;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get title => _title;
  set title(String? title) => _title = title;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;
  String? get category => _category;
  set category(String? category) => _category = category;
  String? get content => _content;
  set content(String? content) => _content = content;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get creator => _creator;
  set creator(String? creator) => _creator = creator;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get image => _image;
  set image(String? image) => _image = image;
  int? get likeCount => _likeCount;
  set likeCount(int? likeCount) => _likeCount = likeCount;
  String? get link => _link;
  set link(String? link) => _link = link;
  String? get pubDate => _pubDate;
  set pubDate(String? pubDate) => _pubDate = pubDate;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Data.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _title = json['title'];
    _iV = json['__v'];
    _category = json['category'];
    _content = json['content'];
    _createdAt = json['createdAt'];
    _creator = json['creator'];
    _description = json['description'];
    _image = json['image'];
    _likeCount = json['likeCount'];
    _link = json['link'];
    _pubDate = json['pubDate'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['title'] = this._title;
    data['__v'] = this._iV;
    data['category'] = this._category;
    data['content'] = this._content;
    data['createdAt'] = this._createdAt;
    data['creator'] = this._creator;
    data['description'] = this._description;
    data['image'] = this._image;
    data['likeCount'] = this._likeCount;
    data['link'] = this._link;
    data['pubDate'] = this._pubDate;
    data['updatedAt'] = this._updatedAt;
    return data;
  }
}

class CatModel {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  CatModel(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  CatModel.fromJson(Map<String, dynamic> json) {
    if (json["current_page"] is int) {
      currentPage = json["current_page"];
    }
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
    if (json["first_page_url"] is String) {
      firstPageUrl = json["first_page_url"];
    }
    if (json["from"] is int) {
      from = json["from"];
    }
    if (json["last_page"] is int) {
      lastPage = json["last_page"];
    }
    if (json["last_page_url"] is String) {
      lastPageUrl = json["last_page_url"];
    }
    if (json["links"] is List) {
      links = json["links"] == null
          ? null
          : (json["links"] as List).map((e) => Links.fromJson(e)).toList();
    }
    if (json["next_page_url"] is String) {
      nextPageUrl = json["next_page_url"];
    }
    if (json["path"] is String) {
      path = json["path"];
    }
    if (json["per_page"] is int) {
      perPage = json["per_page"];
    }
    prevPageUrl = json["prev_page_url"];
    if (json["to"] is int) {
      to = json["to"];
    }
    if (json["total"] is int) {
      total = json["total"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["current_page"] = currentPage;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["first_page_url"] = firstPageUrl;
    _data["from"] = from;
    _data["last_page"] = lastPage;
    _data["last_page_url"] = lastPageUrl;
    if (links != null) {
      _data["links"] = links?.map((e) => e.toJson()).toList();
    }
    _data["next_page_url"] = nextPageUrl;
    _data["path"] = path;
    _data["per_page"] = perPage;
    _data["prev_page_url"] = prevPageUrl;
    _data["to"] = to;
    _data["total"] = total;
    return _data;
  }
}

class Links {
  dynamic url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json["url"];
    if (json["label"] is String) {
      label = json["label"];
    }
    if (json["active"] is bool) {
      active = json["active"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url"] = url;
    _data["label"] = label;
    _data["active"] = active;
    return _data;
  }
}

class Data {
  String? breed;
  String? country;
  String? origin;
  String? coat;
  String? pattern;

  Data({this.breed, this.country, this.origin, this.coat, this.pattern});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["breed"] is String) {
      breed = json["breed"];
    }
    if (json["country"] is String) {
      country = json["country"];
    }
    if (json["origin"] is String) {
      origin = json["origin"];
    }
    if (json["coat"] is String) {
      coat = json["coat"];
    }
    if (json["pattern"] is String) {
      pattern = json["pattern"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["breed"] = breed;
    _data["country"] = country;
    _data["origin"] = origin;
    _data["coat"] = coat;
    _data["pattern"] = pattern;
    return _data;
  }
}

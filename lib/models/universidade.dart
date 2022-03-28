class UniversidadeModel {
  String? country;
  String? name;
  List<String>? webPages;

  UniversidadeModel({this.country, this.name, this.webPages});

  UniversidadeModel.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    name = json['name'];
    webPages = json['web_pages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['name'] = name;
    data['web_pages'] = webPages;
    return data;
  }
}
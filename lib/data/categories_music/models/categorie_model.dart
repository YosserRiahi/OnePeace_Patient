// ignore_for_file: public_member_api_docs, sort_constructors_first

class Categories {
  List<Categorie>? categorie;

  Categories({this.categorie});

  Categories.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categorie = <Categorie>[];
      json['categories'].forEach((v) {
        categorie!.add(Categorie.fromJson(v));
      });
    }
  }
}

class Categorie {
  int? id;
  String? name;
  String? imageUrl;
  String? createAt;
  List<Musiques>? musiques;

  Categorie({this.id, this.name, this.imageUrl, this.createAt, this.musiques});

  Categorie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    createAt = json['create_at'];
    if (json['musiques'] != null) {
      musiques = <Musiques>[];
      json['musiques'].forEach((v) {
        musiques!.add(Musiques.fromJson(v));
      });
    }
  }
}

class Musiques {
  int? id;
  String? title;
  String? url;
  int? categoryId;

  Musiques({this.id, this.title, this.url, this.categoryId});

  Musiques.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    categoryId = json['category_id'];
  }
}

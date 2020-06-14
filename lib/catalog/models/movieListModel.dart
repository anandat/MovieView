class MovieModel {
  List<Data> data;

  MovieModel({this.data});

  MovieModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String title;
  String year;
  String genre;
  String poster;

  Data({this.id, this.title, this.year, this.genre, this.poster});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    year = json['year'];
    genre = json['genre'];
    poster = json['poster'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['year'] = this.year;
    data['genre'] = this.genre;
    data['poster'] = this.poster;
    return data;
  }
}

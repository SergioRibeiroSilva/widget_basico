class User {
  int? id;
  String? name;
  String? email;

  User(int id, String name, String email);

  User.fromJson(Map json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }
}

class Character {
  int id;
  String nama;
  String alamat;
  String email;

  Character.fromJson(Map json)
      : id = json['id'],
        nama = json['nama'],
        alamat = json['alamat'],
        email = json['email'];

  Map toJson() {
    return {'id': id, 'nama': nama, 'alamat': alamat, 'email': email};
  }
}

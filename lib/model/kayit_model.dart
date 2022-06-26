class HesapModel {
  late int id;

  HesapModel({required this.id});

  toMap() {
    return {'roomId': id};
  }
}

class KayitOlModel {
  late String ad;
  late String soyad;
  late String email;
  late String sifre;

  KayitOlModel(
      {required this.email,
      required this.sifre,
      required this.ad,
      required this.soyad});

  Map<String, String> toMap() {
    return {
      'ad': ad,
      'soyad': soyad,
      'email': email,
      'sifre': sifre,
    };
  }
}

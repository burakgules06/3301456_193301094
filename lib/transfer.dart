import 'package:firebase_auth/firebase_auth.dart';

class Transfer {
  String id;
  final String borclar;
  final String alinanlar;
  final String email;

  Transfer({
    this.id = '',
    required this.borclar,
    required this.alinanlar,
    required this.email,
  });
  final user = FirebaseAuth.instance.currentUser!;
  Map<String, dynamic> toJson() => {
        'id': id,
        'borclar': borclar,
        'alinanlar': alinanlar,
        'email': email,
      };
  static Transfer fromJson(Map<String, dynamic> json) => Transfer(
      id: json['id'] ?? 0,
      borclar: json['borclar'] ?? '',
      alinanlar: json['alinanlar'] ?? '',
      email: json['email'] ?? '');
}

class UserModel {
  final String userId;
  final String name;
  final String email;
  final String role;
  final String? imageUrl;
  final String phone;
  final String level;
    final String dadphone;


  
  

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.role,
     this.imageUrl, required this.phone, required this.level, required this.dadphone,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json['userId'],
    name: json['name'],
    email: json['email'],
    role: json['role'],
    imageUrl: json['imageUrl'],
    phone: json['phone'],
    level: json['level'],
    dadphone: json['dadphone'],
  );
  Map<String, dynamic> toJson() => {
    'userId': userId,
    'name': name,
    'email': email,
    'role': role,
    'imageUrl': imageUrl,
    'phone': phone,
    'level': level,
    'dadphone': dadphone,
  };
  UserModel copyWith({
    String? userId,
    String? name,
    String? email,
    String? role,
    String? imageUrl,
    String? phone,
    String? level,
    String? dadphone,
  }) => UserModel(
    userId: userId ?? this.userId,
    name: name ?? this.name,
    email: email ?? this.email,
    role: role ?? this.role,
    imageUrl: imageUrl ?? this.imageUrl,
    phone: phone ?? this.phone,
    level: level ?? this.level,
    dadphone: dadphone ?? this.dadphone,
  );
}
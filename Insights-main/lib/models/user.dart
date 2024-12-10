class User {
  final int id;
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String name;
  final String birthDate;
  final String phone;
  final String nationalId;
  final int? planId;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.name,
    required this.birthDate,
    required this.phone,
    required this.nationalId,
    this.planId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['u_id'],
      email: json['u_email'],
      password: json['u_password'],
      firstName: json['u_first_name'],
      lastName: json['u_last_name'],
      name: json['u_name'],
      birthDate: json['u_birth_date'],
      phone: json['u_phone'],
      nationalId: json['u_national_id'],
      planId: json['PlanID'] != null ? json['PlanID'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'u_id': id,
      'u_email': email,
      'u_password': password,
      'u_first_name': firstName,
      'u_last_name': lastName,
      'u_name': name,
      'u_birth_date': birthDate,
      'u_phone': phone,
      'u_national_id': nationalId,
      'PlanID': planId,
    };
  }
}

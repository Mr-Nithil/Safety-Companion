class user {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String birthday;
  final String contactNumber;

  const user({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.birthday,
    required this.contactNumber,
  });

  toJson() {
    return {
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'password': password,
      'birthday': birthday,
      'contact number': contactNumber
    };
  }
}

class Profile {
  String name;
  String email;
  String phone;
  String address;
  String photo;

  Profile({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    this.photo = '',
  });
}
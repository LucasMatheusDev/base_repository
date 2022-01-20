class UserSingIn {
  final String email;
  final String password;

  UserSingIn({required this.email, required this.password}) {
    email.toString().trim();
    password.toString().trim();
  }
}

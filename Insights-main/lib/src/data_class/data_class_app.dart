// ignore_for_file: public_member_api_docs, sort_constructors_first
class PasswordScreenTitleData {
  String title;
  PasswordScreenTitleData({
    required this.title,
  });
}

class ConfirmByForgetOrLogin {
  bool isForget;
  bool isLogin;
  ConfirmByForgetOrLogin({
    this.isForget = false,
    this.isLogin = false,
  });
}

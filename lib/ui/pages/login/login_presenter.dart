abstract class LoginPresenter {
  void validateEmail(String email);

  void validatePassword(String pass) {}

  Stream get emailErrorStream;
  Stream get passwordErrorStream;
  Stream get isFormValidStream;
}

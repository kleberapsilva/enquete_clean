abstract class LoginPresenter {
  void validateEmail(String email);

  void validatePassword(String pass) {}
  void auth() {}
  void dispose() {}

  Stream get emailErrorStream;
  Stream get passwordErrorStream;
  Stream get isFormValidStream;
  Stream get isLoadingStream;
  Stream get mainErrorStream;
}

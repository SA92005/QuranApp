class CheckStatusCode {
  static bool isSuccess(int code) {
    return code >= 200 && code < 300;
  }
}

class GlobalData {
  // Singleton instance
  static final GlobalData _instance = GlobalData._internal();

  // Private constructor
  GlobalData._internal();

  // Singleton accessor
  factory GlobalData() => _instance;

  // Member variables
  String? email;
  String? password;
  String? name;
  // List<int>? dataList;

  // Methods to manipulate the data
  void setEmail(String data) {
    email = data;
  }

  String? getEmail() {
    return email;
  }

  String? getPassword() {
    return password;
  }

  void setPassword(String data) {
    password = data;
  }

  String? getName() {
    return name;
  }

  void setName(String data) {
    name = data;
  }

}

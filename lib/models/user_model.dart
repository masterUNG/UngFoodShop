class UserModel {
  // Field
  int id;
  String Name, User, Password;

  // Constructor
  UserModel(this.id, this.Name, this.User, this.Password);

  UserModel.fromJSON(Map<String, dynamic> parseJSON) {
    id = int.parse(parseJSON['id']);
    Name = parseJSON['Name'];
    User = parseJSON['User'];
    Password = parseJSON['Password'];
  }
}

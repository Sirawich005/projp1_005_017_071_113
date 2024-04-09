class MyUserEntity{
  String userID;
  String email;
  String name;
  bool hasActiveLibrary;

  MyUserEntity({
    required this.userID,
    required this.email,
    required this.name,
    required this.hasActiveLibrary,
  });

  Map<String, Object?> toDocument(){
    return{
      'userID': userID,
      'email': email,
      'name': name,
      'hasActiveLibrary': hasActiveLibrary,
    };
  } 

  static MyUserEntity fromDocument(Map<String, dynamic> doc){
    return MyUserEntity(
      userID: doc['userID'],
      email: doc['email'],
      name: doc['name'],
      hasActiveLibrary: doc['hasActiveLibrary'],
    );
  } 
}

import '../entities/entities.dart';

class MyUser{
  String userID;
  String email;
  String name;
  bool hasActiveLibrary;

  MyUser({
    required this.userID,
    required this.email,
    required this.name,
    required this.hasActiveLibrary,
  });

  static final empty = MyUser(
    userID: '',
    email: '',
    name: '',
    hasActiveLibrary: false,
  );

  MyUserEntity toEntity(){
    return MyUserEntity(
      userID: userID,
      email: email,
      name: name,
      hasActiveLibrary: hasActiveLibrary,
    );
  }

  static MyUser fromEntity(MyUserEntity entity){
    return MyUser(
      userID: entity.userID,
      email: entity.email,
      name: entity.name,
      hasActiveLibrary: entity.hasActiveLibrary
    );
  }

  @override
  String toString(){
    return 'MyUser: $userID, $email, $name, $hasActiveLibrary';
  }

  

}
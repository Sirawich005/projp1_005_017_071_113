import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth _fireBaseAuth;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth,
  }) : _fireBaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  
  @override
  Future<void> logOut() async {
    await _fireBaseAuth.signOut();
  }
  
  @override
  Future<void> setUserData(MyUser myUser) async {
    try{
      await usersCollection
        .doc(myUser.userID)
        .set(myUser.toEntity().toDocument());
    }catch (e){
      log(e.toString());
      rethrow;
    }
  }
  
  
  @override
  Future<void> signIn(String email, String password) async {
    try{
      await _fireBaseAuth.signInWithEmailAndPassword(email: email, password: password);
    }catch (e){
      log(e.toString());
      rethrow;
    }
  }
  
  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try{
      UserCredential user = await _fireBaseAuth.createUserWithEmailAndPassword(
         email: myUser.email,
         password: password
         );
         myUser.userID = user.user!.uid;
         return myUser;
    }catch (e){
      log(e.toString());
      rethrow;
    }
  }
  
  @override
  Stream<MyUser?> get user {
    return _fireBaseAuth.authStateChanges().flatMap((firebaseUser) async*{
      if(firebaseUser == null){
        yield MyUser.empty;
      }else{
        yield await usersCollection
          .doc(firebaseUser.uid)
          .get()
          .then((value) => MyUser.fromEntity(MyUserEntity.fromDocument(value.data()!)));
    }
  });

  }
}
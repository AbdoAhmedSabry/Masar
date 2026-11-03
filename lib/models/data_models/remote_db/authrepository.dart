import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning/core/utils/app_exception_handler.dart';
import 'package:elearning/models/data_models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CollectionReference<Map<String, dynamic>> get users => _db.collection('users');

  User? get currentUser => _auth.currentUser;

  //  إنشاء حساب جديد
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      final user = UserModel(
        userId: cred.user!.uid,
        name: name,
        email: email,
        role: "",
        phone: "",
        level: "",
        dadphone: "",
      );

      await users.doc(user.userId).set(user.toJson());
      return user;
    } catch (e) {
      throw AppExceptionHandler.handleException(e);
    }
  }

  //  تسجيل الدخول بالإيميل والباسورد
  Future<UserModel> signIn({required String email, required String password}) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return getUser(cred.user!.uid);
    } catch (e) {
      throw AppExceptionHandler.handleException(e);
    }
  }

  //  جلب بيانات المستخدم
  Future<UserModel> getUser(String userId) async {
    try {
      final doc = await users.doc(userId).get();
      if (doc.exists && doc.data() != null) {
        return UserModel.fromJson(doc.data()!);
      } else {
        throw 'المستخدم غير موجود في قاعدة البيانات';
      }
    } catch (e) {
      throw AppExceptionHandler.handleException(e);
    }
  }

  //  التسجيل  جوجل
  Future<UserModel> signUpWithGoogle() async {
    try {
      final googleProvider = GoogleAuthProvider();
      final cred = await _auth.signInWithPopup(googleProvider);
      
      final userId = cred.user!.uid;
      final userDoc = await users.doc(userId).get();

      if (userDoc.exists && userDoc.data() != null) {
        return UserModel.fromJson(userDoc.data()!);
      } else {
        final user = UserModel(
          userId: userId,
          name: cred.user!.displayName ?? '', 
          email: cred.user!.email ?? '',
          role: "",
          phone: "",
          level: "",
          dadphone: "",
        );
        await users.doc(userId).set(user.toJson());
        return user;
      }
    } catch (e) {
      throw AppExceptionHandler.handleException(e);
    }
  }

  //  تحديث باقي البيانات 
  Future<void> updateUserProfile({
    required String userId,
    required Map<String, dynamic> updatedData,
  }) async {
    try {
      await users.doc(userId).update(updatedData);
    } catch (e) {
      throw AppExceptionHandler.handleException(e);
    }
  }

  //  إرسال إيميل إعادة تعيين كلمة المرور
  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw AppExceptionHandler.handleException(e);
    }
  }

  //  تسجيل الخروج
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw AppExceptionHandler.handleException(e);
    }
  }
}
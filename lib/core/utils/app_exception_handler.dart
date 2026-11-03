import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppExceptionHandler {
  static String handleException(dynamic error) {
    if (error is FirebaseAuthException) {
      return _handleAuthException(error);
    } else if (error is FirebaseException) {
      return _handleFirebaseFirestoreException(error);
    } else if (error is FormatException) {
      return 'حدث خطأ أثناء معالجة البيانات، يرجى المحاولة لاحقاً.';
    } else {
      return error.toString().replaceAll('Exception: ', '');
    }
  }

  static String _handleAuthException(FirebaseAuthException error) {
    switch (error.code) {
      case 'user-not-found':
        return 'الحساب غير موجود. يرجى التأكد من البريد الإلكتروني.';
      case 'wrong-password':
        return 'كلمة المرور غير صحيحة.';
      case 'email-already-in-use':
        return 'البريد الإلكتروني مستخدم بالفعل بحساب آخر.';
      case 'invalid-email':
        return 'صيغة البريد الإلكتروني غير صحيحة.';
      case 'weak-password':
        return 'كلمة المرور ضعيفة جداً، يرجى استخدام 6 أحرف على الأقل.';
      case 'user-disabled':
        return 'تم تعطيل هذا الحساب. يرجى التواصل مع الدعم الفني.';
      case 'operation-not-allowed':
        return 'طريقة تسجيل الدخول هذه غير مفعلة حالياً.';
      case 'too-many-requests':
        return 'تمت محاولات دخول كثيرة فاشلة. يرجى المحاولة لاحقاً.';
      case 'network-request-failed':
        return 'فشل الاتصال بالإنترنت، يرجى التحقق من الشبكة والمحاولة مرة أخرى.';
      case 'account-exists-with-different-credential':
        return 'يوجد حساب بالفعل بنفس البريد الإلكتروني ولكن بطريقة تسجيل مختلفة.';
      case 'invalid-credential':
        return 'بيانات الاعتماد غير صالحة أو منتهية الصلاحية.';
      case 'credential-already-in-use':
        return 'بيانات الاعتماد مستخدمة بالفعل مع حساب آخر.';
      case 'requires-recent-login':
        return 'هذه العملية حساسة وتتطلب إعادة تسجيل الدخول مرة أخرى لأسباب أمنية.';
      default:
        return 'خطأ في المصادقة: ${error.message ?? "حدث خطأ غير معروف"}';
    }
  }

  static String _handleFirebaseFirestoreException(FirebaseException error) {
    switch (error.code) {
      case 'permission-denied':
        return 'ليس لديك الصلاحية الكافية للوصول إلى هذه البيانات.';
      case 'unavailable':
        return 'الخادم غير متوفر حالياً، يرجى التحقق من الاتصال والمحاولة لاحقاً.';
      case 'not-found':
        return 'المستند أو البيانات المطلوبة غير موجودة في الخادم.';
      case 'already-exists':
        return 'البيانات موجودة بالفعل مسبقاً ولا يمكن تكرارها.';
      case 'cancelled':
        return 'تم إلغاء عملية جلب البيانات.';
      case 'data-loss':
        return 'حدث تلف أو فقدان في البيانات المسترجعة.';
      case 'deadline-exceeded':
        return 'انتهت مهلة الانتظار، يرجى التحقق من سرعة الإنترنت لديك.';
      case 'resource-exhausted':
        return 'تم استنفاد الموارد المتاحة مؤقتاً، يرجى المحاولة لاحقاً.';
      case 'aborted':
        return 'تم إجهاض العملية بسبب حدوث تضارب في البيانات.';
      case 'out-of-range':
        return 'العملية الحالية خارج النطاق المسموح به.';
      case 'unauthenticated':
        return 'يرجى تسجيل الدخول أولاً لتتمكن من إتمام هذه العملية.';
      default:
        return 'حدث خطأ في النظام: ${error.message ?? error.code}';
    }
  }
}

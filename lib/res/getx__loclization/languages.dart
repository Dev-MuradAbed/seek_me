import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => <String, Map<String, String>>{
        'en_US': <String, String>{
          'email_hint': 'Email',
          'internet_exception':
              "We're unable tp show results.\nPlease check your data\nconenction.",
          'general_exception':
              "We're unable to process your request.\n Please try again",
          'welcome_back': 'Welcome\nBack',
          'login': 'Login',
          'password_hint': 'Password',
        },
        'ar_SR': <String, String>{
          'email_hint': 'ادخل الايميل',
          'internet_exception':
              "We're unable tp show results.\nPlease check your data\nconenction.",
          'general_exception':
              "We're unable to process your request.\n Please try again",
          'welcome_back': 'Welcome\nBack',
          'login': 'Login',
          'password_hint': 'Password',
        }
      };
}

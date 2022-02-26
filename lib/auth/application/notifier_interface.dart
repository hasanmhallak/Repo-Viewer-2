import 'package:oauth2/oauth2.dart';
import '../domain/entities/user.dart';

abstract class Notifier {
  Future<User?> get user;
  Future<Credentials?> get credentials;
}

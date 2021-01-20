import 'package:meta/meta.dart';
class Chat {
  final String imageUrl;
  final String username;
  final String message;

  const Chat({
    @required this.imageUrl,
    @required this.username,
    @required this.message,
  });
}
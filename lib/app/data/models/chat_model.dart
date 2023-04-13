import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String email;
  final String message;
  final String name;
  final Timestamp sendAt;

  Message({
    required this.email,
    required this.message,
    required this.name,
    required this.sendAt,
  });

  factory Message.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Message(
      email: data['email'] ?? '',
      message: data['message'] ?? '',
      name: data['name'] ?? '',
      sendAt: data['send_at'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'message': message,
      'name': name,
      'send_at': sendAt,
    };
  }
}

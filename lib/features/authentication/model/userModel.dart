import 'package:flutterstore/utils/formatters/formatter.dart';

class UserModel {
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.id,
  });
  final String id;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String phoneNumber;
  final String profilePicture;

  // full name

  String get fullName => '$firstName $lastName';
  String get formattedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  /// static function to split user
  static List<String> namePart(fullName) => fullName.toString().split(" ");

  static String generateUserName(fullName) {
    List<String> namePart = fullName.toString().split(" ");
    String firstName = namePart[0].trim();
    String lastName =
        namePart.length > 1 ? namePart[1].trim().toLowerCase() : "";

    String cameCaseUserName = "$firstName$lastName";
    String userNameWithPrefix = "cwt_$cameCaseUserName";
    return userNameWithPrefix;
  }

  static UserModel empty() => UserModel(
        firstName: '',
        lastName: '',
        userName: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
        id: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'id': id
    };
  }
}

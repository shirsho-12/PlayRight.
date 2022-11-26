import 'prompt.dart';

part 'user.g.dart';

/// {@template user}
/// User description
/// {@endtemplate}
class User {
  /// {@macro user}
  const User({
    required this.userName,
    required this.userAvatarLink,
    required this.name,
    required this.archive,
  });

  /// Creates a User from Json map
  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);

  /// A description for userName
  final String userName;

  /// A description for userAvatarLink
  final String userAvatarLink;

  /// A description for name
  final String name;

  /// A description for archive
  final List<Prompt> archive;

  /// Creates a Json map from a User
  Map<String, dynamic> toJson() => _$UserToJson(this);

  static const dummy = User(
    userName: '@rachelsmith1234',
    userAvatarLink: '',
    name: 'Rachel Smith',
    archive: [],
  );
}

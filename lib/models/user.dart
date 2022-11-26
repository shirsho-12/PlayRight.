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

  static final dummy = User(
    userName: '@rachelsmith1234',
    userAvatarLink: '',
    name: 'Rachel Smith',
    archive: [
      Prompt(
          time: DateTime.parse('2022-07-15'),
          promptText: "School Play Ideas",
          promptResults: Prompt.presetData("")),
      Prompt(
          time: DateTime.parse('2022-07-18'),
          promptText: "Personal project",
          promptResults: Prompt.presetData("")),
      Prompt(
          time: DateTime.parse('2022-07-20'),
          promptText: "Retro Pop Culture",
          promptResults: Prompt.presetData("")),
      Prompt(
          time: DateTime.parse('2022-08-01'),
          promptText: "Christmas Concert",
          promptResults: Prompt.presetData("")),
      Prompt(
          time: DateTime.parse('2022-08-12'),
          promptText: "Fantasy Adventure",
          promptResults: Prompt.presetData("")),
    ],
  );
}



part 'prompt.g.dart';

/// {@template prompt}
/// Prompt description
/// {@endtemplate}
class Prompt {
  /// {@macro prompt}
  const Prompt({ 
    required this.time,
    required this.promptText,
    required this.promptResults,
  });

  /// Creates a Prompt from Json map
  factory Prompt.fromJson(Map<String, dynamic> data) => _$PromptFromJson(data);

  /// A description for time
  final DateTime time;
  /// A description for promptText
  final String promptText;
  /// A description for promptResults
  final List<String> promptResults;

  /// Creates a copy of the current Prompt with property changes
  Prompt copyWith({ 
    DateTime? time,
    String? promptText,
    List<String>? promptResults,
  }) {
    return Prompt(
      time: time ?? this.time,
      promptText: promptText ?? this.promptText,
      promptResults: promptResults ?? this.promptResults,
    );
  }
  
  /// Creates a Json map from a Prompt
  Map<String, dynamic> toJson() => _$PromptToJson(this);
}

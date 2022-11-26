part of 'prompt.dart';

Prompt _$PromptFromJson(Map<String, dynamic> json) => Prompt(
      time: json['time'] as DateTime,
      promptText: json['promptText'] as String,
      promptResults: json['promptResults'] as List<String>,
    );

Map<String, dynamic> _$PromptToJson(Prompt instance) => <String, dynamic>{ 
      'time': instance.time,
      'promptText': instance.promptText,
      'promptResults': instance.promptResults,
    };
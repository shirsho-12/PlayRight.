import 'package:flutter/cupertino.dart';
import 'package:openai_gpt3_api/openai_gpt3_api.dart';
import 'package:play_right/api_key.dart';

class PromptModel {
  final api = GPT3(apiKey);

  Future<List<String>> getPrompt(String prompt) async {
    final response = await api.completion(
      prompt,
      maxTokens: 50,
      temperature: 0.9,
      topP: 1,
      presencePenalty: 0.6,
      frequencyPenalty: 0.5,
      bestOf: 3,
      n: 3,
      stream: false,
      stop: '###',
    );
    List<String> outputs = response.choices.map((e) => e.text).toList();
    return outputs;
  }

//   Future<List<NetworkImage>> getImagePrompt(String prompt) async {
//     api.
//   }
}

Future<List<String>> promptTexts(String prompt) async {
  final promptModel = PromptModel();
  final promptTexts = await promptModel.getPrompt(prompt);
  return promptTexts;
}

Future<List<Image>> promptImages(String prompt) async {
  final promptModel = PromptModel();
  final promptTexts = await promptModel.getPrompt(prompt);
  return promptTexts.map((e) => Image.network(e)).toList();
}

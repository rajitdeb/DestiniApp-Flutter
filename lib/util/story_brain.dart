import 'dart:developer';

import '../model/story.dart';

class StoryBrain {
  // Story Data
  final List<Story> _storyData = [
    Story(
      storyTxt:
          "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\".",
      choice1: "I'll hop in. Thanks for the help!",
      choice2: "Better ask him if he's a murderer first.",
    ),
    Story(
      storyTxt: "He nods slowly, unphased by the question.",
      choice1: "At least he\'s honest. I\'ll climb in.",
      choice2: "Wait, I know how to change a tire.",
    ),
    Story(
      storyTxt:
          "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.",
      choice1: "I love Elton John! Hand him the cassette tape.",
      choice2: "It\'s him or me! You take the knife and stab him.",
    ),
    Story(
      storyTxt:
          "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?",
      choice1: "Restart",
      choice2: "",
    ),
    Story(
      storyTxt:
          "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.",
      choice1: "Restart",
      choice2: "",
    ),
    Story(
      storyTxt:
          "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier\".",
      choice1: "Restart",
      choice2: "",
    )
  ];

  // Story Counter
  int _storyCounter = 0;

  // Get Story
  String getStory() {
    return _storyData[_storyCounter].storyTxt;
  }

  // Get Choice 1
  String getChoice1() {
    return _storyData[_storyCounter].choice1;
  }

  // Get Choice 2
  String getChoice2() {
    return _storyData[_storyCounter].choice2;
  }

  // Next Story
  void nextStory(int choice) {
    if (_storyCounter == 0) {
      _choiceCase(choice, 2, 1);
    } else if (_storyCounter == 1) {
      _choiceCase(choice, 2, 3);
    } else if (_storyCounter == 2) {
      _choiceCase(choice, 5, 4);
    } else {
      _restart();
    }
  }

  void _choiceCase(int choice, int ifCase, int elseCase) {
    if (choice == 1) {
      _storyCounter = ifCase;
    } else {
      _storyCounter = elseCase;
      log("Choice: $choice, StoryCounter: $_storyCounter");
    }
  }

  void _restart() {
    _storyCounter = 0;
  }

  bool shouldButtonBeVisible() {
    if (_storyCounter == 3 || _storyCounter == 4 || _storyCounter == 5) {
      return false;
    } else {
      return true;
    }
  }
}

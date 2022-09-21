import 'story.dart';

class StoryBrain {
  int storySteps = 0;
  int storyNumber = 0;
  bool stateForSecondButton = true;

  List<Story> _storyData = [
    Story(
        storyTitle:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cel phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with souless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choice1: 'I\'l hop in. Thanks for the help!',
        choice2: 'Better ask him if he\'s a murderer first.'),
    Story(
        storyTitle: 'He nods slowly, unphased by the question.',
        choice1: 'At least he\'s honest. I\'l climb in.',
        choice2: 'Wait, I know how to change a tire.'),
    Story(
        storyTitle:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choice1: 'I love Elton John! Hand him the cassette tape.',
        choice2: 'It\'s him or me! You take the knife and stab him.'),
    Story(
        storyTitle:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyTitle:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyTitle:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choice1: 'Restart',
        choice2: '')
  ];

  String getStory() {
    return _storyData[storyNumber].storyTitle;
  }

  String getChoice1() {
    return _storyData[storyNumber].choice1;
  }

  String getChoice2() {
    return _storyData[storyNumber].choice2;
  }

  void nextStoryFromChoiceOne() {
    switch (storyNumber) {
      case 0:
        storyNumber = 2;
        break;
      case 1:
        storyNumber = 2;
        break;
      case 2:
        storyNumber = 5;
        break;
      case 3:
        storyNumber = 0;
        break;
      case 4:
        storyNumber = 0;
        break;
      case 5:
        storyNumber = 0;
        break;
    }
  }

  void nextStoryFromChoiceTwo() {
    switch (storyNumber) {
      case 0:
        storyNumber = 1;
        break;
      case 1:
        storyNumber = 3;
        break;
      case 2:
        storyNumber = 4;
        break;
    }
  }

  void checkForButtonTwoContent() {
    if (_storyData[storyNumber].choice2 == '') {
      stateForSecondButton = false;
    } else {
      stateForSecondButton = true;
    }
  }
}

//TODO: Step 23 - Use the storyNumber property inside getStory(), getChoice1() and getChoice2() so that it gets the updated story and choices rather than always just the first (0th) one.

//TODO: Step 8 - Create a method caled getStory() that returns the first storyTitle from _storyData.

//TODO: Step 11 - Create a method caled getChoice1() that returns the text for the first choice1 from _storyData.

//TODO: Step 12 - Create a method caled getChoice2() that returns the text for the first choice2 from _storyData.

//TODO: Step 25 - Change the storyNumber property into a private property so that only story_brain.dart has access to it. You can do this by right clicking on the name (storyNumber) and selecting Refactor -> Rename to make the change across al the places where it's used.

//TODO: Step 16 - Create a property caled storyNumber which starts with a value of 0. This wil be used to track which story the user is currently viewing.

//TODO: Step 17 - Create a method caled nextStory(), it should not have any outputs but it should have 1 input caled choiceNumber which wil be the choice number (int) made by the user.

//TODO: Step 20 - Download the story plan here: https:drive.google.comuc?export=download&id=1KU6EghkO9Hf2hRM0756xFHgNaZyGCou3

//TODO: Step 21 - Using the story plan, update nextStory() to change the storyNumber depending on the choice made by the user. e.g. if choiceNumber was equal to 1 and the storyNumber is 0, the storyNumber should become 2.

//TODO: Step 22 - In nextStory() if the storyNumber is equal to 3 or 4 or 5, that means it's the end of the game and it should cal a method caled restart() that resets the storyNumber to 0.

//TODO: Step 27 - Create a method caled buttonShouldBeVisible() which checks to see if storyNumber is 0 or 1 or 2 (when both buttons should show choices) and return true if that is the case, else it should return false.

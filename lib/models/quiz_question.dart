// set questions as a regular objects (based on a class) that group the question
// & the possible answers together into one data structure
class QuizQuestion {
  // const keyword makes the constructor constant, meaning a new instance
  // cannot be modified after creation.
  // initializes the text and answers properties.
  const QuizQuestion(
    this.text,
    this.answers,
  );

  // A final field that holds the question text
  final String text;
  // A final field that holds the list of possible answers
  final List<String> answers;

  // create a shuffling method
  List<String> get shuffledAnswers {
    // creates a new list (shuffledList) as a copy of the answers list
    final shuffledList = List.of(answers);
    // shuffles the elements in the shuffledList randomly
    shuffledList.shuffle();
    // returns the shuffled list of answers
    return shuffledList;
  }
}

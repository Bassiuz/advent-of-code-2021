int countTotalSyntaxErrorScore(List<String> data) {
  var score = 0;
  for (var line in data) {
    score = score + countSyntaxErrorScore(line);
  }
  return score;
}

int countTotalUnfinishedLineScore(List<String> data) {
  var scores = [];
  for (var line in data) {
    if (countSyntaxErrorScore(line) == 0) {
      scores.add(countUnfinishedLineScore(line));
    }
  }
  scores.sort();
  // return middle item of scores
  return scores.length > 0 ? scores[scores.length ~/ 2] : 0;
}

int countUnfinishedLineScore(String line) {
  var chars = line.split('');
  var currentChunkOpeners = [];

  for (var char in chars) {
    if (CLOSING_CHARACTERS.contains(char)) {
      var currentChunkOpener = currentChunkOpeners.last;
      if (OPENING_CHARACTERS.indexOf(currentChunkOpener) ==
          CLOSING_CHARACTERS.indexOf(char)) {
        // this means they are the same 'type' and thus close the chunk
        currentChunkOpeners.removeLast();
      }
    } else if (OPENING_CHARACTERS.contains(char)) {
      currentChunkOpeners.add(char);
    }
  }

  var score = 0;

  while (currentChunkOpeners.isNotEmpty) {
    var addCharacter = CLOSING_CHARACTERS[
        OPENING_CHARACTERS.indexOf(currentChunkOpeners.last)];

    score = (score * 5) + returnCompletionScoreForChar(addCharacter);
    currentChunkOpeners.removeLast();
  }

  // no syntax error found so no score is returned
  return score;
}

const List<String> CLOSING_CHARACTERS = ['}', ')', ']', '>'];
const List<String> OPENING_CHARACTERS = ['{', '(', '[', '<'];

int countSyntaxErrorScore(String line) {
  var chars = line.split('');
  var currentChunkOpeners = [];

  for (var char in chars) {
    if (CLOSING_CHARACTERS.contains(char)) {
      var currentChunkOpener = currentChunkOpeners.last;
      if (OPENING_CHARACTERS.indexOf(currentChunkOpener) ==
          CLOSING_CHARACTERS.indexOf(char)) {
        // this means they are the same 'type' and thus close the chunk
        currentChunkOpeners.removeLast();
      } else {
        // this means they are different 'types' and thus are a syntax error
        return returnScoreForChar(char);
      }
    } else if (OPENING_CHARACTERS.contains(char)) {
      currentChunkOpeners.add(char);
    }
  }

  // no syntax error found so no score is returned
  return 0;
}

int returnScoreForChar(String char) {
  switch (char) {
    case ')':
      return 3;
    case ']':
      return 57;
    case '}':
      return 1197;
    case '>':
      return 25137;
    default:
      return 0;
  }
}

int returnCompletionScoreForChar(String char) {
  switch (char) {
    case ')':
      return 1;
    case ']':
      return 2;
    case '}':
      return 3;
    case '>':
      return 4;
    default:
      return 0;
  }
}

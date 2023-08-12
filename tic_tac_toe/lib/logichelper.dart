List<List<String>> game = List.generate(3, (_) => List.generate(3, (_) => ' '));

bool winner(String c, int row, int column) {
  bool win = false;
  // column
  for (int hello = 0; hello < 3; hello++) {
    if (game[hello][column] == c && !win) {
      if (hello == 2) win = true;
    } else {
      break;
    }
  }
  for (int hello = 0; hello < 3; hello++) {
    if (game[row][hello] == c && !win) {
      if (hello == 2) win = true;
    } else {
      break;
    }
  }
  int fir = 0, sec = 0;
  while (fir < 3 && sec < 3) {
    if (game[fir][sec] == c && !win) {
      if (fir == 2) win = true;
      fir++;
      sec++;
    } else {
      break;
    }
  }
  fir = 0;
  sec = 2;
  while (fir < 3 && sec >= 0) {
    if (game[fir][sec] == c && !win) {
      if (fir == 2) win = true;
      fir++;
      sec--;
    } else {
      break;
    }
  }
  // print(" win character " + c + "  " + win.toString());
  return win;
}

void cheacker(List<int> coord) {
  int l = coord[0];
  int m = coord[1];
  game[l][m] = 'X';
}

bool player2(int row, int column) {
  bool winnerFound = false;
  game[row][column] = '0';

  winnerFound = winner('0', row, column);
  if (winnerFound) {
    // print("User 2 is the winner");
    return true;
  }

  return false;
}

bool player1(int row, int column) {
  bool winnerFound = false;

  // print("User 1 : ");

  game[row][column] = 'X';

  winnerFound = winner('X', row, column);
  if (winnerFound) {
    // print("User 1 is the winner");
    return true;
  }

  return false;
}

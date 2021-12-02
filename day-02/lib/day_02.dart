int multiplyHorizontalAndVerticalPoisitionOfCommands(List<String> commands) {
  var x = 0;
  var y = 0;

  for (String command in commands) {
    if (command.startsWith('forward')) {
      x += int.parse(command.split(' ')[1]);
    } else if (command.startsWith('down')) {
      y += int.parse(command.split(' ')[1]);
    } else if (command.startsWith('up')) {
      y -= int.parse(command.split(' ')[1]);
    }
  }

  return x * y;
}

int getLocationResultWithAim(List<String> commands) {
  var x = 0;
  var y = 0;
  var aim = 0;

  for (String command in commands) {
    if (command.startsWith('forward')) {
      x += int.parse(command.split(' ')[1]);
      y += int.parse(command.split(' ')[1]) * aim;
    } else if (command.startsWith('down')) {
      aim += int.parse(command.split(' ')[1]);
    } else if (command.startsWith('up')) {
      aim -= int.parse(command.split(' ')[1]);
    }
  }

  return x * y;
}

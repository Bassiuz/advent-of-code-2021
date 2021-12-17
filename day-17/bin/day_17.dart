import 'package:day_17/day_17.dart';

void main(List<String> arguments) {
  var input = 'target area: x=248..285, y=-85..-56';

  print('Highest Y of shot in $input is ${highestYFromShotInto(input)}');
  print(
      'Different amount of shots for $input is ${differentAmountOfVelocities(input)}');
}

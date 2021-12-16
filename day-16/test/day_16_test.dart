import 'package:day_16/day_16.dart';
import 'package:test/test.dart';

void main() {
  test('part 1', () {
    expect(convertHexadecimalToBitString('D2FE28'), '110100101111111000101000');

    expect(
        convertBitStringToListOfMaps(convertHexadecimalToBitString('D2FE28'))[0]
            ["version"],
        6);
    expect(
        convertBitStringToListOfMaps(convertHexadecimalToBitString('D2FE28'))[0]
            ["typeID"],
        4);
    expect(
        convertBitStringToListOfMaps(convertHexadecimalToBitString('D2FE28'))[0]
            ["literalValue"],
        2021);

    expect(
        convertBitStringToListOfMaps(
            convertHexadecimalToBitString('38006F45291200'))[0]["version"],
        1);
    expect(
        convertBitStringToListOfMaps(
            convertHexadecimalToBitString('38006F45291200'))[0]["typeID"],
        6);
    expect(
        convertBitStringToListOfMaps(
            convertHexadecimalToBitString('38006F45291200'))[0]["lengthTypeID"],
        0);

    expect(returnVersionTotalFromData('8A004A801A8002F478'), 16);
    //expect(returnVersionTotalFromData('C0015000016115A2E0802F182340'), 23);

    //expect(returnVersionTotalFromData('A0016C880162017C3686B18A3D4780'), 31);
  });
}

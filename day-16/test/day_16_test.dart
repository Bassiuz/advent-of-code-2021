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
            ["value"],
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

    expect(returnTotalFromDataType('8A004A801A8002F478'), 16);
    expect(returnTotalFromDataType('C0015000016115A2E0802F182340'), 23);

    expect(returnTotalFromDataType('A0016C880162017C3686B18A3D4780'), 31);
  });

  test('part 2', () {
    expect(
        returnTotalFromDataType('C200B40A82',
            dataType: 'value', recursive: false),
        3);
    expect(
        returnTotalFromDataType('04005AC33890',
            dataType: 'value', recursive: false),
        54);
    expect(
        returnTotalFromDataType('880086C3E88112',
            dataType: 'value', recursive: false),
        7);
    expect(
        returnTotalFromDataType('CE00C43D881120',
            dataType: 'value', recursive: false),
        9);

    expect(
        returnTotalFromDataType('9C0141080250320F1802104A08',
            dataType: 'value', recursive: false),
        1);
  });
}

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tisbi_isu/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.photoMy).existsSync(), true);
    expect(File(Images.qrCode).existsSync(), true);
  });
}

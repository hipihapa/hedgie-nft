import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:nft/resources/resources.dart';

void main() {
  test('assets assets test', () {
    expect(File(Assets.compass).existsSync(), isTrue);
    expect(File(Assets.h1).existsSync(), isTrue);
    expect(File(Assets.h2).existsSync(), isTrue);
    expect(File(Assets.h3).existsSync(), isTrue);
    expect(File(Assets.heart).existsSync(), isTrue);
    expect(File(Assets.home).existsSync(), isTrue);
    expect(File(Assets.i1).existsSync(), isTrue);
    expect(File(Assets.i2).existsSync(), isTrue);
    expect(File(Assets.i3).existsSync(), isTrue);
    expect(File(Assets.menu).existsSync(), isTrue);
    expect(File(Assets.right).existsSync(), isTrue);
    expect(File(Assets.setting).existsSync(), isTrue);
  });
}

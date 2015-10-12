@TestOn('browser')
library bwu_fontawesome_iconset_svg.test.simple;

import 'package:test/test.dart';
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/iron_iconset_svg.dart';
import 'package:polymer_elements/paper_toolbar.dart';
import 'package:polymer_elements/iron_icon.dart';
import 'package:polymer_elements/paper_menu.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/paper_menu_button.dart';
import 'package:polymer_elements/paper_item.dart';
import 'package:bwu_fontawesome_iconset_svg/bwu_fontawesome_iconset_svg.dart';
import 'some_component.dart';

/// Silence analyzer [IronIcon], [PaperIconButton], [PaperItem], [PaperMenu],
/// [PaperToolbar], [PaperMenuButton], [SomeComponent],
/// [silenceBwuFontawesomeIconsetSvg]
main() async {
  await initPolymer();
  group('icon', () {
    test('simple', () {
      expect(true, isTrue);
    });
  });
}

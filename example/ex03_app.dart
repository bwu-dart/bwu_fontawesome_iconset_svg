@HtmlImport('ex03_app.html')
library bwu_fontawesome_iconset_svg.example.example03;

import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:bwu_fontawesome_iconset_svg/bwu_fontawesome_iconset_svg.dart';
import 'package:polymer_elements/iron_icon.dart';
import 'package:polymer_elements/iron_meta.dart';
import 'package:polymer_elements/iron_iconset_svg.dart';
import 'package:polymer_elements/iron_flex_layout.dart';

/// Silence analyzer [IronIcon], [silenceBwuFontawesomeIconsetSvg]
@PolymerRegister('ex03-app')
class Ex03App extends PolymerElement {
  Ex03App.created() : super.created();

  @property
  List iconNames = [];

  ready() {
    final iconSets = (new IronMeta()..type = 'iconset').list;
    final iconNames = ((iconSets.first as IronIconsetSvg).getIconNames()
        as List<String>)..sort();
    set('iconNames', iconNames);
  }
}

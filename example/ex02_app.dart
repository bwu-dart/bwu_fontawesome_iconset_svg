@HtmlImport('ex02_app.html')
library bwu_fontawesome_iconset_svg.example.example02;

import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/iron_icon.dart';
import 'package:polymer_elements/paper_button.dart';
import 'package:polymer_elements/social_icons.dart';
import 'package:bwu_fontawesome_iconset_svg/bwu_fontawesome_iconset_svg.dart';
import 'some_component.dart';

import 'dart:html' as dom;

/// Silence analyzer [IronIcon], [PaperButton], [SomeComponent],
/// [silenceBwuFontawesomeIconsetSvg]
@PolymerRegister('ex02-app')
class Ex02App extends PolymerElement {
  Ex02App.created() : super.created();

  void attached() {
    super.attached();

    ($['glass'] as dom.Element).style
      ..setProperty('fill', 'red')
      ..setProperty('stroke', 'blue')
      ..setProperty('stroke-with', '3px');

    new PolymerDom($['some-component'].root).querySelector('iron-icon').style
      ..setProperty('fill', 'yellow')
      ..setProperty('stroke', 'green')
      ..setProperty('stroke-with', '3px');
  }
}

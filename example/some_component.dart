@HtmlImport('some_component.html')
library polymer_elements_demo.web.iron_pages.iron_pages_demo;

import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:bwu_fontawesome_iconset_svg/bwu_fontawesome_iconset_svg.dart';
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/iron_icon.dart';

/// Silence analyzer [IronIcon], [silenceBwuFontawesomeIconsetSvg]
@PolymerRegister('some-component')
class SomeComponent extends PolymerElement {
  SomeComponent.created() : super.created();
}

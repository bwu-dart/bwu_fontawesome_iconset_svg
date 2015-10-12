@HtmlImport('all_icons.html')
library bwu_fontawesome_iconset_svg.test.all_icons_element;

import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/iron_meta.dart';
import 'package:polymer_elements/iron_iconset_svg.dart';

@PolymerRegister('all-icons')
class AllIcons extends PolymerElement {
  AllIcons.created() : super.created();

  @property
  List iconNames = [];

  attached() {
    final iconSets = (new IronMeta()..type = 'iconset').list;
    final iconNames = ((iconSets.first as IronIconsetSvg).getIconNames()
        as List<String>)..sort();
    set('iconNames', iconNames);
  }
}

library bwu_fontawesome_iconset_svg.test.all_icons_element;

import 'dart:html' as dom;
import 'package:polymer/polymer.dart';

@CustomTag('all-icons')
class AllIcons extends PolymerElement {
  AllIcons.created() : super.created();

  @observable
  List iconNames = toObservable([]);

  attached() {
    super.attached();
    List<dom.Element> icons =
        $['iconset'].shadowRoot.querySelector('svg').querySelectorAll('g');
    iconNames.addAll(icons.map((i) => i.id).toList()..sort());
  }
}

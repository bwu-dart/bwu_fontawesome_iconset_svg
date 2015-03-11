import 'package:polymer/polymer.dart';

import 'dart:html' as dom;

@CustomTag('ex02-app')
class Ex02App extends PolymerElement {
  Ex02App.created() : super.created();

  void attached() {
    super.attached();

    ($['bookmark-button'] as dom.Element).style
      ..setProperty('fill', 'red')
      ..setProperty('stroke', 'blue')
      ..setProperty('stroke-with', '3px');

    ($['some-component'] as dom.Element).shadowRoot
        .querySelector('core-icon').style
      ..setProperty('fill', 'red')
      ..setProperty('stroke', 'blue')
      ..setProperty('stroke-with', '3px');
  }
}

import 'package:polymer/polymer.dart';

import 'dart:html' as dom;

@CustomTag('ex02-app')
class Ex02App extends PolymerElement {

  Ex02App.created() : super.created() {
  }

  attached() {
    super.attached();

//    ($['bookmark-button'] as dom.Element).querySelector('* /deep/ #icon').style
// the above version doesn't work in Firefox
    ($['bookmark-button'] as dom.Element).shadowRoot.olderShadowRoot.querySelector('#icon').style
        ..setProperty('fill', 'red')
        ..setProperty('stroke', 'blue')
        ..setProperty('stroke-with', '3px');
  }
}

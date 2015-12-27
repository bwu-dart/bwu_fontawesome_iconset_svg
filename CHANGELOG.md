## 0.3.0-3
- update dependencies (Polymer 1.0.0-rc.10)

## 0.3.0-2
- update to FontAwesome 4.4.0

## 0.3.0-1
- update to polymer 1.0.0-rc.2, polymer_elements 1.0.0-rc.2
- use `@HtmlImport` (there is no `bwu-fontawesome-iconset-svg` element anymore.

## 0.2.1
- Use Grinder default tasks from `bwu_grinder_tasks` instead of `bwu_utils_dev`.
- Fix Travis build.

## 0.2.0
- update to Font Awesome 4.3.0
- automate download of new Font Awesome version and regenerating the Polymer
  element.

## 0.1.4
- move `test` from `dev_dependencies` to `dependencies`.

## 0.1.3
- ??

## 0.1.2
- widen dependency constraints for core-elements 0.7.0
- moved paper-elements to dev_dependencies

## 0.1.1
- widen dependency constraints for Polymer 0.16.0
- use dartformat

## 0.1.0
- widen dependency constraints for paper-elements and core-elements
- remove script tags for dart.js, platform.js, and dart_support.js because they
are inserted automatically by the transformer anyway.
- update examples

## 0.0.8
- widen dependency constraints for polymer, paper-elements, core-elements

## 0.0.7
- update to Polymer 0.14.0

## 0.0.6+2
- fix links in README.md

## 0.0.6+1
- added links to examples to `README.md`
- added example03 to list all icons contained in the iconset
- fixed #1 (type in width attribute)

## 0.0.6
- update to Polymer 0.13.0
- setting width and height style on core-icon now resizes the icon accordingly
(JavaScript change landed in Dart core-elements)

## 0.0.5+1
- example03 that shows how to set style attributes for `<core-icon>` in Dart code.

## 0.0.5+1
- fix homepage URL in pubspec.yaml

## 0.0.5
- update to Polymer 0.12.0+5
- update to core_elements 0.1.1
- update to paper_elements 0.1.0+2

## 0.0.4
- make it work in Firefox
- embed resources (Font Awesome icon fonts and CSS) into the package to avoid CORS issues

## 0.0.3
- fix type in GitHub repository name

## 0.0.2
- fix issues with import paths
- embed FontAwesome files instead of loading from CDN (because of CORS issue

## 0.0.1
- initial release

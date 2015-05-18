library bwu_fontawesome_iconset_svg.tool.grind;

import 'dart:io' as io;
import 'package:grinder/grinder.dart';
import 'fa_upgrade.dart' as fa;

const sourceDirs = const ['bin', 'lib', 'tool', 'test', 'example'];

main(List<String> args) => grind(args);

@Task('Run analyzer')
analyze() => new PubApp.global('tuneup').run(['check']);

@Task('Runn all tests')
// TODO(zoechi) make test work in Firefox
test() => new PubApp.local('test')
    .run(['-j1', '-pdartium', /*'-pchrome', '-pfirefox', '-pphantomjs'*/]);

@Task('Check everything')
@Depends(analyze, /*checkFormat,*/ lint, test)
check() {
  run('pub', arguments: ['publish', '-n']);
}

//@Task('Check source code format')
//checkFormat() => checkFormatTask(['.']);

/// format-all - fix all formatting issues
@Task('Fix all source format issues')
formatAll() => new PubApp.global('dart_style').run(['-w']..addAll(sourceDirs),
    script: 'format');

@Task('Run lint checks')
lint() => new PubApp.global('linter')
    .run(['--stats', '-ctool/lintcfg.yaml']..addAll(sourceDirs));

@Task('Build examples to JavaScript')
buildExample() => Pub.build(mode: 'release', directories: ['example']);

/// Currently the target version needs to be updated manually in `fa_upgrade.dart`.
// TODO(zoechi) support version argument when Grinder supports it.
@Task('Update to latest Font Awesome version')
faUpgrade() => fa.upgrade();

/// Similar to `fa-upgrade` but skips download (assumes download already succeeded).
@Task('Generate the iconset element')
faGenerate() => fa.upgrade(skipDownload: true);

@Task('Generate GitHub pages (examples)')
gh() {
  final rootDir = io.Directory.current.path;
  new PubApp.global('ghpages_generator').run(
      ['--with-examples', '--root-dir=${rootDir}'], script: 'generate_ghpages');
}

@Task('Push generated GitHub pages')
ghp() => run('git', arguments: ['push', 'origin', 'gh-pages', '-f']);

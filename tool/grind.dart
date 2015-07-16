library bwu_fontawesome_iconset_svg.tool.grind;

import 'dart:io' as io;
export 'package:bwu_grinder_tasks/bwu_grinder_tasks.dart';
import 'package:bwu_grinder_tasks/bwu_grinder_tasks.dart';
import 'package:grinder/grinder.dart';
import 'fa_upgrade.dart' as fa;

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

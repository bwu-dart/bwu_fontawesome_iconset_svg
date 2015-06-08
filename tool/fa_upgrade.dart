library bwu_fontawesome_iconset_svg.tool.upgrade;

import 'dart:async' show Future;
import 'dart:io' as io;
import 'package:path/path.dart' as path;
import 'package:archive/archive.dart';

const newVersion = '4.3.0';
final downloadUri = Uri.parse(
    'http://fortawesome.github.io/Font-Awesome/assets/font-awesome-${newVersion}.zip');
const libDirectoryPath = 'lib';
const faExtractDirectory = '${libDirectoryPath}/font-awesome-${newVersion}';
const variablesFilePath = '${faExtractDirectory}/less/variables.less';
const elementTemplateFilePath = 'tool/element_template.html';
const elementFilePath = '${libDirectoryPath}/bwu_fontawesome_iconset_svg.html';
final faVersionRegExp = new RegExp(r'\${fa_version}');
final iconsRegExp = new RegExp(r'\${icons}');
final varsRegExp = new RegExp(r'^\s*@fa-var-(.*)\:\s*\"\\([a-f0-9]{4})\";\s*$');

//main() {
//  upgrade();
//}

io.Directory tempDir;

Future upgrade({bool skipDownload: false}) async {
  if (!skipDownload) {
    final archiveFile = await _download();
    await _removeOld();
    await _extract(archiveFile);
    await _cleanupTemp();
  }
  await _generateElement();
}

void _removeOld() {
  final oldDir = new io.Directory(libDirectoryPath)
      .listSync()
      .where((d) => d is io.Directory &&
          d.path.startsWith(path.join(libDirectoryPath, 'font-awesome-')));
  if (oldDir != null && oldDir.length > 1) {
    throw 'More than one old directory found. `_removeOld()` can\'t continue';
  }
  if (oldDir.isNotEmpty) {
    oldDir.first.deleteSync(recursive: true);
  }
}

Future<io.File> _download() async {
  tempDir = io.Directory.systemTemp.createTempSync('bwufa');
  print(tempDir.path);
  final downloadFile = path.join(tempDir.path, 'download.zip');
  final file = new io.File(downloadFile);
  final fileSink = file.openWrite();
  io.HttpClient client = new io.HttpClient();
  io.HttpClientRequest request = await client.getUrl(downloadUri);
  io.HttpClientResponse response = await request.close();
  await fileSink.addStream(response);
  print(file.path);
  return file;
}

void _extract(io.File archiveFile) {
  List<int> bytes = archiveFile.readAsBytesSync();
  final archive = new ZipDecoder().decodeBytes(bytes);
  for (ArchiveFile file in archive) {
    String filename = file.name;
    if (filename.endsWith('/')) {
      new io.Directory(path.join(libDirectoryPath, filename)).createSync();
    } else {
      List<int> data = file.content;
      new io.File(path.join(libDirectoryPath, filename))
        ..createSync(recursive: true)
        ..writeAsBytesSync(data);
    }
  }

  final outDir = path.join(libDirectoryPath, archive.first.name);
  if ('${faExtractDirectory}/' != outDir) {
    throw 'The output directory "${outDir}" differs from the expected "${faExtractDirectory}".';
  }
}

void _cleanupTemp() {
  if (tempDir != null) {
    tempDir.deleteSync(recursive: true);
  }
}

void _generateElement() {
  final vars = new io.File(variablesFilePath)
      .readAsLinesSync()
      .where((l) => l.trim().startsWith('@fa-var-'));

  final icons = vars.map((v) {
    final matches = varsRegExp.firstMatch(v);
    try {
      return _iconMarkup(matches.group(1), matches.group(2));
    } catch (e) {
      print(e);
    }
  }).join('\n');

  var template = new io.File(elementTemplateFilePath)
      .readAsStringSync()
      .replaceAll(faVersionRegExp, newVersion)
      .replaceFirst(iconsRegExp, icons);

  new io.File(elementFilePath).writeAsStringSync(template, flush: true);
}

String _iconMarkup(String id, String code) =>
    '          <g id="${id}"><text class="bwu-fa-icon"  x="12" y="12">&#x${code};</text></g>';

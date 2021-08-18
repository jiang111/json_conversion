import 'dart:async';

import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:json_conversion_annotation/json_conversion_annotation.dart';
import 'package:source_gen/source_gen.dart';

import 'bean_info.dart';

/// @author newtab on 2021/8/18

const _outputExtensions = '.jc.dart';

class JsonConversionBuilder extends Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final resolver = buildStep.resolver;
    if (!await resolver.isLibrary(buildStep.inputId)) return;
    final lib = await buildStep.inputLibrary;
    final reader = LibraryReader(lib);
    String output;
    Iterable<AnnotatedElement> element = reader.annotatedWith(TypeChecker.fromRuntime(JsonConversionTarget));
    if (element.isNotEmpty) {
      output = await _generate(element.first.element.displayName, reader, buildStep);

      await buildStep.writeAsString(
        buildStep.inputId.changeExtension(_outputExtensions),
        output,
      );
    }
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        '.dart': [_outputExtensions]
      };

  Future<String> _generate(String clazzName, LibraryReader reader, BuildStep buildStep) async {
    List<BeanInfo> beans = [];
    final pattern = '**/*.dart';
    final assetIds = await buildStep.findAssets(Glob(pattern)).toList()
      ..sort();
    final resolver = buildStep.resolver;
    for (var inputId in assetIds) {
      if (!await resolver.isLibrary(inputId)) continue;
      final lib = await resolver.libraryFor(inputId);
      final generatedBean = await _generateBeanInfo(LibraryReader(lib), inputId);
      if (generatedBean != null) {
        beans.add(generatedBean);
      }
    }
    return '''
$defaultFileHeader

${beans.map((e) => e.import).join('\n')}


class JsonConversion\$$clazzName {

 static M fromJson<M>(dynamic json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json);
    }
  }

  static M _fromJsonSingle<M>(dynamic json) {

    String type = M.toString();

${beans.map((e) {
      return """
    if(type == (${e.name}).toString()){
      return ${e.name}.jsonConversion(json)  as M;
    }
    """;
    }).join('\n')}
    throw Exception("not found");
  }

  static M _getListChildType<M>(List<dynamic> data) {
  ${beans.map((e) {
      return """
    if(<${e.name}>[] is M){
      return data.map<${e.name}>((e) => ${e.name}.jsonConversion(e)).toList() as M;
    }
    """;
    }).join('\n')}
    throw Exception("not found");
  }
}
''';
  }

  _generateBeanInfo(LibraryReader library, AssetId inputId) {
    try {
      final annotatedElement = library.annotatedWith(TypeChecker.fromRuntime(JsonConversion)).first;
      final className = annotatedElement.element.displayName;
      final path = inputId.path;
      final package = inputId.package;
      final import = "import 'package:$package/${path.replaceFirst('lib/', '')}';";
      return BeanInfo(import, className);
    } on StateError catch (_) {
      return null;
    }
  }
}

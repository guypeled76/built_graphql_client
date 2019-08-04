import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:petitparser_extras/petitparser_extras.dart';
import 'package:source_gen/source_gen.dart';

import 'package:built_graphql_client/built_graphql_client.dart';

class GraphqlGenerator extends GeneratorForAnnotation<GraphqlQuery> {
  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {


    return "// Hey! Annotation found!";
  }

  String generateCommand(String className, String query, AstNode schema) {

    GraphQLParser parser = GraphQLParser();

    return generateCommandCode(parser.parseToAstWithSchemaAst(query, schema));
  }

  String generateCommandCode(AstNode query) {
    // query.children.whereType<TypeDefinition>();
    return "d";
  }
}

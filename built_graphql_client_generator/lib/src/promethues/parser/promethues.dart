

import 'package:built_graphql_client_generator/src/ast/index.dart';
import 'package:built_graphql_client_generator/src/promethues/grammar/prometheus.dart';
import 'package:built_graphql_client_generator/src/grammer/transformer.dart';
import 'package:petitparser/petitparser.dart';

class PrometheusParser extends GrammarParser  {
  PrometheusParser() : super(const PrometheusParserDefinition());
}

class PrometheusParserDefinition extends PrometheusGrammarDefinition with GrammarTransformer {
  const PrometheusParserDefinition();


  @override
  Parser start() {
    return super.start().map((value) => CompilationUnit(as_list(value)));
  }

  Parser NAME() {
    return super.NAME().trim().map((value)=>NameNode(value));
  }

  Parser function() {

  }

  Parser vector() {

  }

}
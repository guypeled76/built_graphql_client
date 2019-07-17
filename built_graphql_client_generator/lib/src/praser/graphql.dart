

import 'package:built_graphql_client_generator/src/ast/index.dart';
import 'package:built_graphql_client_generator/src/grammer/graphql.dart';
import 'package:built_graphql_client_generator/src/grammer/transformer.dart';
import 'package:petitparser/petitparser.dart';

class GraphQLParser extends GrammarParser  {
  GraphQLParser() : super(const GraphQLParserDefinition());
}

class GraphQLParserDefinition extends GraphQLGrammarDefinition with GrammarTransformer {
  const GraphQLParserDefinition();


  @override
  Parser start() {
    return super.start().map((value) => CompilationUnit(as_list(value)));
  }

  Parser operation() {
    return super.operation().map((value) =>
        OperationNode(
            as_name(value),
            as_value(value, OperationType.Query),
            as_list(value)));
  }

  Parser operationType() {
    return super.operationType().map((value) {
      switch(value) {
        case 'mutation':
          return ValueNode(OperationType.Mutation);
        case 'query':
        default:
          return ValueNode(OperationType.Query);
      }

    });
  }

  Parser NAME() {
    return super.NAME().trim().map((value)=>NameNode(value));
  }


  Parser field() {
    return super.field().map((value)=>FieldNode(as_name(value), as_list(value), as_list(value), as_list(value)));
  }

  Parser fieldName() {
    return ref(alias) | ref(NAME);
  }

}
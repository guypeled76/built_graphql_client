

import 'package:built_graphql_client_generator/src/ast/node.dart';

import 'node.dart';

class NameNode extends AstNode {
  final String name;

  NameNode(this.name);

  @override
  ResultType visit<ResultType, ContextType>(AstVisitor<ResultType, ContextType> visitor, ContextType context) {
    return visitor.visitNameNode(this, context);
  }
}
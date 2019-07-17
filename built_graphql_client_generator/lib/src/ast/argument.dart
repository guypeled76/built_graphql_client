

import 'package:built_graphql_client_generator/src/ast/node.dart';

import 'named.dart';
import 'expression.dart';

class ArgumentNode extends NamedNode implements ExpressionNode {


  final ExpressionNode value;

  ArgumentNode(name, this.value) : super(name);

  @override
  ResultType visit<ResultType, ContextType>(AstVisitor<ResultType, ContextType> visitor, ContextType context) {
    return visitor.visitArgumentNode(this, context);
  }



}
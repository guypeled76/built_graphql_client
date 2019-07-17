
import 'package:built_graphql_client_generator/src/ast/node.dart';

import 'expression.dart';
import 'named.dart';

class VariableNode extends NamedNode implements ExpressionNode  {




  VariableNode(name) : super(name);

  @override
  ResultType visit<ResultType, ContextType>(AstVisitor<ResultType, ContextType> visitor, ContextType context) {
    return visitor.visitVariableNode(this, context);
  }



}
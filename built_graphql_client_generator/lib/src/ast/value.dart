


import 'node.dart';

class ValueNode<ValueType> extends AstNode {
  final ValueType value;

  ValueNode(this.value);


  @override
  ResultType visit<ResultType, ContextType>(AstVisitor<ResultType, ContextType> visitor, ContextType context) {
    return visitor.visitValueNode(this, context);
  }
}
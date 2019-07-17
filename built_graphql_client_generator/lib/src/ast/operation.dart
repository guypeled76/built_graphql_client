


import 'container.dart';
import 'field.dart';
import 'index.dart';

class OperationNode extends ContainerNode {

  final OperationType type;

  OperationNode(String name, this.type, List<FieldNode> fields) : super(name, fields);

  @override
  ResultType visit<ResultType, ContextType>(AstVisitor<ResultType, ContextType> visitor, ContextType context) {
    return visitor.visitOperationNode(this, context);
  }
}

enum OperationType {
  Query,
  Mutation
}
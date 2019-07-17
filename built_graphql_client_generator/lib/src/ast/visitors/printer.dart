

import 'package:built_graphql_client_generator/src/ast/primitive.dart';

import '../index.dart';

class Printer<Context extends PrinterContext> implements AstVisitor<String,Context> {
  @override
  String visitArgumentNode(ArgumentNode argumentNode, Context context) {
    // TODO: implement visitArgumentNode
    return null;
  }

  @override
  String visitCompilationUnit(CompilationUnit compilationUnit, Context context) {
    // TODO: implement visitCompilationUnit
    return null;
  }

  @override
  String visitDirectiveNode(DirectiveNode directiveNode, Context context) {
    // TODO: implement visitDirectiveNode
    return null;
  }

  @override
  String visitFieldNode(FieldNode fieldNode, Context context) {
    // TODO: implement visitFieldNode
    return null;
  }

  @override
  String visitNameNode(NameNode nameNode, Context context) {
    // TODO: implement visitNameNode
    return null;
  }

  @override
  String visitOperationNode(OperationNode operationNode, context) {
    // TODO: implement visitOperationNode
    return null;
  }

  @override
  String visitExpressionNode(ExpressionNode valueNode, context) {
    // TODO: implement visitValueNode
    return null;
  }

  @override
  String visitVariableNode(VariableNode variableNode, context) {
    // TODO: implement visitVariableNode
    return null;
  }

  @override
  String visitPrimitiveNode(PrimitiveNode primitiveNode, context) {
    // TODO: implement visitPrimitiveNode
    return null;
  }


}

class PrinterContext {

}
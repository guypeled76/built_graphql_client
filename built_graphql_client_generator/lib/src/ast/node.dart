import 'package:built_graphql_client_generator/src/ast/primitive.dart';
import 'package:built_graphql_client_generator/src/ast/argument.dart';
import 'package:built_graphql_client_generator/src/ast/compilationUnit.dart';
import 'package:built_graphql_client_generator/src/ast/container.dart';
import 'package:built_graphql_client_generator/src/ast/directive.dart';
import 'package:built_graphql_client_generator/src/ast/field.dart';
import 'package:built_graphql_client_generator/src/ast/name.dart';
import 'package:built_graphql_client_generator/src/ast/named.dart';
import 'package:built_graphql_client_generator/src/ast/operation.dart';
import 'package:built_graphql_client_generator/src/ast/expression.dart';
import 'package:built_graphql_client_generator/src/ast/variable.dart';
import 'package:built_graphql_client_generator/src/ast/visitors/printer.dart';

abstract class AstNode {

  AstNode();

  List<AstNode> get children => const <AstNode>[];


  @override
  String toString() {
    return this.visit(Printer(), PrinterContext());
  }

  ResultType visit<ResultType, ContextType>(AstVisitor<ResultType, ContextType> visitor, ContextType context);

}

class AstVisitor<ResultType, ContextType> {
  
  ResultType visitCompilationUnit(CompilationUnit compilationUnit, ContextType context) {
    return null;
  }

  ResultType visitArgumentNode(ArgumentNode argumentNode, ContextType context) {
    return null;
  }

  ResultType visitDirectiveNode(DirectiveNode directiveNode, ContextType context) {
    return null;
  }

  ResultType visitFieldNode(FieldNode fieldNode, ContextType context) {
    return null;
  }

  ResultType visitNameNode(NameNode nameNode, ContextType context) {
    return null;
  }

  ResultType visitExpressionNode(ExpressionNode valueNode, context) {
    return null;
  }

  ResultType visitOperationNode(OperationNode operationNode, context) {
    return null;
  }

  ResultType visitVariableNode(VariableNode variableNode, context) {
    return null;
  }

  ResultType visitPrimitiveNode(PrimitiveNode primitiveNode, context) {
    return null;
  }

}
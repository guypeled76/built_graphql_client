



import 'argument.dart';
import 'container.dart';
import 'named.dart';
import 'node.dart';

class DirectiveNode extends NamedNode implements ContainerNode {

  final List<ArgumentNode> arguments;

  DirectiveNode(String name, this.arguments) : super(name);

  @override
  List<AstNode> get children => <AstNode>[...arguments];

  @override
  ResultType visit<ResultType, ContextType>(AstVisitor<ResultType, ContextType> visitor, ContextType context) {
    return visitor.visitDirectiveNode(this, context);
  }
}
import 'package:petitparser/petitparser.dart';

import 'base.dart';

class GraphQLGrammar extends GrammarParser {
  GraphQLGrammar() : super(const GraphQLGrammarDefinition());
}

class GraphQLGrammarDefinition extends GrammarBaseDefinition {
  const GraphQLGrammarDefinition();

  @override
  Parser start() {
    return ref(document).end().flatten();
  }

  Parser document() {
    return ref(definition).plus();
  }

  Parser definition() {
    return ref(operationDefinition) | (ref(operationType) & ref(NAME) & ref(
        variableDefinitions).optional() & ref(directives).optional() & ref(
        selectionSet));
  }

  Parser operationDefinition() {
    return ref(selectionSet) | (ref(operationType) & ref(NAME).optional() & ref(
        variableDefinitions).optional() & ref(directives).optional() & ref(
        selectionSet));
  }

  Parser selectionSet() {
    return ref(OPEN_BRACE) & ref(selection) & (ref(COMMA).optional() & ref(
        selection)).star() & ref(CLOSE_BRACE);
  }

  Parser operationType() {
    return (ref(QUERY) | ref(MUTATION)).trim();
  }

  Parser selection() {
    return ref(field) | ref(fragmentSpread) | ref(inlineFragment);
  }

  Parser field() {
    return ref(fieldName) & ref(arguments).optional() & ref(directives)
        .optional() & ref(selectionSet).optional();
  }

  Parser fieldName() {
    return ref(alias) | ref(NAME);
  }

  Parser alias() {
    return ref(NAME) & ref(COLON) & ref(NAME);
  }

  Parser arguments() {
    return ref(OPEN_PARENTHESIS) & ref(argument) & (ref(COMMA) & ref(argument))
        .star() & ref(CLOSE_PARENTHESIS);
  }

  Parser argument() {
    return ref(NAME) & ref(COLON) & ref(valueOrVariable);
  }

  Parser fragmentSpread() {
    return ref(SPREAD) & ref(fragmentName) & ref(directives).optional();
  }

  Parser inlineFragment() {
    return ref(SPREAD) & ref(ON) & ref(typeCondition) & ref(directives)
        .optional() & ref(selectionSet);
  }

  Parser fragmentDefinition() {
    return ref(FRAGMENT) & ref(fragmentName) & ref(ON) & ref(
        typeCondition) & ref(directives).optional() & ref(selectionSet);
  }

  Parser fragmentName() {
    return ref(NAME);
  }

  Parser directives() {
    return ref(directive).plus();
  }

  Parser directive() {
    return (ref(AT) & ref(NAME) & ref(COLON) & ref(valueOrVariable)) |
    (ref(AT) & ref(NAME)) |
    (ref(AT) & ref(NAME) & ref(OPEN_PARENTHESIS) & ref(argument) & ref(
        CLOSE_PARENTHESIS));
  }

  Parser typeCondition() {
    return ref(typeName);
  }

  Parser variableDefinitions() {
    return ref(OPEN_PARENTHESIS) & ref(variableDefinition) & (ref(COMMA) & ref(
        variableDefinition)).star() & ref(CLOSE_PARENTHESIS);
  }

  Parser variableDefinition() {
    return ref(variable) & ref(COLON) & ref(type) & ref(defaultValue)
        .optional();
  }

  Parser variable() {
    return ref(DOLLAR) & ref(NAME);
  }

  Parser defaultValue() {
    return ref(EQUAL) & ref(value);
  }

  Parser valueOrVariable() {
    return ref(value) | ref(variable);
  }

  Parser value() {
    return ref(STRING) | ref(NUMBER) | ref(BOOLEAN) | ref(array);
  }

  Parser type() {
    return ref(singleType) | ref(listType);
  }

  Parser<List> singleType() {
    return ref(typeName).seq(ref(nonNullType).optional());
  }

  Parser typeName() {
    return ref(NAME);
  }

  Parser listType() {
    return ref(OPEN_SQUARE) & ref(type) & ref(CLOSE_SQUARE) & ref(nonNullType).optional();
  }

  Parser nonNullType() {
    return ref(EXCLAMATION);
  }

  Parser array() {
    return ref(OPEN_SQUARE) & ref(arrayContent) & ref(CLOSE_SQUARE);
  }

  Parser arrayContent() {
    return (ref(value) & (ref(COMMA) & ref(value)).star()).optional();
  }


}
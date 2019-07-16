import 'package:built_graphql_client_generator/src/praser/graphql.dart';
import 'package:built_graphql_client_generator/src/praser/prometheuse.dart';
import 'package:test/test.dart';

void main() {
  test('Test', () {


    GraphQLGrammar grammar = GraphQLGrammar();

    var test1 = grammar.parse("""query {
  currentUser {
    id,
    name
  } , 
  hashtags {
    id,
    name
  },
  users {
    id,
    name
  }
}""");


    print("result: ${test1.value}");

  });

  test('Test', () {

    PrometheusGrammar prometheusGrammar = PrometheusGrammar();

    var test = prometheusGrammar.parse('fdfd{} + 3');

    print("result: ${test.toString()}");
    print("result: ${test.value}");
  });
}

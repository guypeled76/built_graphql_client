import 'package:test/test.dart';

import 'package:built_graphql_client/built_graphql_client.dart';

void main() {
  group('GraphqlQuery annotation', () {
    test('throws a query null assertion error', () {
      expect(() => GraphqlQuery(null), throwsA(TypeMatcher<AssertionError>()));
    });

    test('has to have a query', () {
      final todo = GraphqlQuery('query { users {id, name}}');
      expect(todo.query, isNotNull);
    });

  });
}

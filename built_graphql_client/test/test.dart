import 'package:test/test.dart';

import 'package:built_graphql_client/built_graphql_client.dart';

void main() {
  group('GraphqlQuery annotation', () {
    test('throws a query null assertion error', () {
      expect(() => GraphQLQuery(null, null), throwsA(TypeMatcher<AssertionError>()));
    });

    test('has to have a query', () {
      final todo = GraphQLQuery('query MyTest { users {id, name}}', '''
      type Query {
        users: [User!]!
      }
      
      type User {
        id: ID!
        name: String!
      }
    ''');
      expect(todo.query, isNotNull);
    });

  });
}

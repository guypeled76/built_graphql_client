import 'package:built_graphql_client/built_graphql_client.dart';
import 'package:built_graphql_client_generator/src/generator.dart';
import 'package:test/test.dart';

void main() {
  test('Test', () {


    final query = GraphQLQuery('''
    query Ronen { users {id, name}}
    query Ronen { users {id, name, email}}'
    ''', '''
      type Query {
        users: [User!]!
      }
      
      type User {
        id: ID!
        name: String!
        email: String!
      }
    ''');


    GraphQLGenerator a = GraphQLGenerator();

    print(a.generateCommand("Test", query));

  });
}

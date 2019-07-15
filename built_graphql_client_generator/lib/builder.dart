import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:built_graphql_client_generator/src/generator.dart';

Builder graphqlBuilderFactory(BuilderOptions options) =>
    SharedPartBuilder([GraphqlGenerator()], 'built_graphql_client');

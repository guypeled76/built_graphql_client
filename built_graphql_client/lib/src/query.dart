class GraphQLQuery {
  final String query;
  final String schema;

  const GraphQLQuery(this.query, this.schema) : assert(query != null && schema != null);
}

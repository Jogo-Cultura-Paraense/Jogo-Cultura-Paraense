import 'package:graphql/client.dart';

class DatoCMSRepository {
  final String _uri = 'https://graphql.datocms.com';
  final String _token = 'cbaacedc536308e03bce861b679ad4';
//8443b646ed7da60e0c0d9455f1343a
  const DatoCMSRepository();

  GraphQLClient _getClient() {
    final HttpLink _httpLink = HttpLink(uri: _uri);
    final AuthLink _authLink = AuthLink(getToken: () => 'Bearer ' + _token);
    final Link _link = _authLink.concat(_httpLink);

    return GraphQLClient(
      cache: InMemoryCache(),
      link: _link,
    );
  }

  Future<dynamic> query(String queryString,
      {Map<String, dynamic> variables, String data}) async {
    final QueryOptions options = QueryOptions(
      documentNode: gql(queryString),
      variables: variables,
    );
    final GraphQLClient client = _getClient();
    final QueryResult result = await client.query(options);
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    return result.data[data];
  }
}

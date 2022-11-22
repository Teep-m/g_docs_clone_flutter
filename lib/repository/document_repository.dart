// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:g_docs_clone_flutter/models/error_model.dart';
import 'package:http/http.dart';

class DocumentRepository {
  final Client _client;
  DocumentRepository({
    required Client client,
  }) : _client = client;

  Future<ErrorModel> createDocument() async {
    ErrorModel error = ErrorModel(
      error: 'Something went wrong',
      data: null,
    );
    try {
      var res = await _client.get(Uri.parse('$host/'), headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'x-auth-token': token,
      });
      switch (res.statusCode) {
        case 200:
          final newUser = UserModel.fromJson(
            jsonEncode(
              jsonDecode(res.body)['user'],
            ),
          ).copyWith(token: token);
          error = ErrorModel(error: null, data: newUser);
          _localStorageRepo.setToken(newUser.token);
          break;
      }
    } catch (e) {
      error = ErrorModel(
        error: e.toString(),
        data: null,
      );
    }
    return error;
  }
}

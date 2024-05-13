import 'package:dartz/dartz.dart';
import 'package:fic16_absensi/core/constants/variables.dart';
import 'package:fic16_absensi/data/datasources/auth_local_datasource.dart';
import 'package:fic16_absensi/data/models/response/note_response_model.dart';
import 'package:http/http.dart' as http;

class NoteRemoteDatasource {
  Future<Either<String, NoteResponseModel>> getNotes() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/api-notes');
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
      },
    );

    if (response.statusCode == 200) {
      return Right(NoteResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get notes');
    }
  }

  Future<Either<String, String>> addNote(
      String title, String description) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/api-notes');
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData?.token}',
    };

    var request = http.MultipartRequest('POST', url);

    request.headers.addAll(headers);
    request.fields['title'] = title;
    request.fields['note'] = description;

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      return const Right('Note added successfully');
    } else {
      return const Left('Failed to add note');
    }
  }
}

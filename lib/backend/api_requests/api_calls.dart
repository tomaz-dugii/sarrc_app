import 'dart:convert';
import 'package:sarrc_app/utils/flutter_flow_util.dart';

import 'api_manager.dart';
export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class RacerusterCall {
  static Future<ApiCallResponse> call() {
    const body = '''
{
  "grant_type": "access_token",
  "client_id": "ILAH0GS9OccIjGAuavpZkJIGO6973pGtjWzESYRm",
  "client_secret": "Aho2z875Zxixl9n3WEU3Qj2ixiWepp0yX4bmhQIZ",
  "username": "example@gmail.com",
  "password": "Password123"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Raceruster',
      apiUrl: 'https://private-anon-2db6c21d5a-racerosterv1.apiary-mock.com/api/oauth/authorize',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
        'content-length': '230',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetParticipantsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get participants',
      apiUrl: 'https://private-anon-2db6c21d5a-racerosterv1.apiary-mock.com/api/v1/events//participants',
      callType: ApiCallType.GET,
      headers: {
        'content-type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SearchAthletByIDNameCall {
  static Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'SearchAthletByIDName',
      apiUrl: 'https://ifrqymdgbbkvqztndmog.supabase.co/rest/v1/test?or=(FirstName.ilike.%$firstName%)&or=(LastName.ilike.%$lastName%)',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlmcnF5bWRnYmJrdnF6dG5kbW9nIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTE4ODczMjYsImV4cCI6MjAwNzQ2MzMyNn0.g2lX93EDzRMK-pUmSDsWzC4PylooNNQYXYV7FTKqed0',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlmcnF5bWRnYmJrdnF6dG5kbW9nIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTE4ODczMjYsImV4cCI6MjAwNzQ2MzMyNn0.g2lX93EDzRMK-pUmSDsWzC4PylooNNQYXYV7FTKqed0',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic participantID(dynamic response) => getJsonField(
        response,
        r'''$[:].ParticipantID''',
        true,
      );
  static dynamic bibID(dynamic response) => getJsonField(
        response,
        r'''$[:].BibID''',
        true,
      );
  static dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$[:].LastName''',
        true,
      );
  static dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$[:].FirstName''',
        true,
      );
  static dynamic sex(dynamic response) => getJsonField(
        response,
        r'''$[:].Sex''',
        true,
      );
  static dynamic city(dynamic response) => getJsonField(
        response,
        r'''$[:].City''',
        true,
      );
  static dynamic state(dynamic response) => getJsonField(
        response,
        r'''$[:].State''',
        true,
      );
  static dynamic country(dynamic response) => getJsonField(
        response,
        r'''$[:].Country''',
        true,
      );
  static dynamic subEvent(dynamic response) => getJsonField(
        response,
        r'''$[:].SubEvent''',
        true,
      );
  static dynamic age(dynamic response) => getJsonField(
        response,
        r'''$[:].Age''',
        true,
      );
  static dynamic eventID(dynamic response) => getJsonField(
        response,
        r'''$[:].EventID''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() => 'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}

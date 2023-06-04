// import 'package:agrishots_flutter/app_flow/data/data.dart';

// import 'request_protocol.dart';

// class AddBookmarkRequest extends HttpRequestProtocol {
//   AddBookmarkRequest({required this.postId});
//   final String postId;

//   @override
//   String get method => HttpMethod.post;

//   @override
//   ContentEncoding get contentEncoding => ContentEncoding.json;

//   @override
//   String get isAuthRequest => Data.key;

//   @override
//   String get path => 'articles/$postId/toggle-bookmark';

//   @override
//   Map<String, dynamic>? get parameters => {};

//   @override
//   Map<String, String> get headers => {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': Data.key,
//         'x-device-hash': Data.deviceId
//       };
// }

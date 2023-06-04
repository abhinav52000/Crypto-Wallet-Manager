// import 'package:connectmywallet/network/network_client/requests/protocol/request_protocol.dart';
// import 'package:connectmywallet/network/network_constant/network_constants.dart';

// class AccountPatchProfileRequest extends HttpRequestProtocol {
//   AccountPatchProfileRequest({
//     this.name,
//     this.email,
//     this.number,
//     this.location,
//     this.profilePicture,
//   });
//   final String? name;
//   final String? email;
//   final String? number;
//   final String? location;
//   final String? profilePicture;

//   @override
//   String get method => HttpMethod.patch;

//   @override
//   ContentEncoding get contentEncoding => ContentEncoding.json;

//   @override
//   String get isAuthRequest => ;

//   @override
//   String get path => NetworkConstants.getProfileEndPoint;

//   @override
//   Map<String, dynamic>? get parameters => {
//         "fullName": name,
//         "phoneNumber": number,
//         "email": email,
//         "location": location,
//         "profilePicture": profilePicture
//       }..removeWhere((key, value) => value == null);
// }

import 'package:resturant_anj/core/class/status_request/statusrequest.dart';

handlingData(response) {
  if (response is StatusRequest) {
    if (response == StatusRequest.offlineFailure) {
      return response;
    } else if (response == StatusRequest.serverFailure) {
      return response;
    } else if (response == StatusRequest.serverException) {
      return response;
    }

  } else {
    return response = StatusRequest.success;
  }
}
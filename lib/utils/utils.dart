import 'constants.dart';

wait(int delayTimeInMs) async {
  await Future.delayed(Duration(milliseconds: delayTimeInMs));
}

String prepareRequestUrl(String serviceName) {
return Constants.urlBase  + serviceName;
}

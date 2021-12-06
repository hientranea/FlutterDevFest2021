import 'package:bloc/bloc.dart';
import 'package:crypto_tracker/screens/splash/splash_event.dart';
import 'package:crypto_tracker/screens/splash/splash_state.dart';
import 'package:crypto_tracker/utils/utils.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final _mockDelayTimeInMs = 2000;

  SplashBloc() : super(SplashInitialize());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is SplashInitializeEvent) {
      await wait(_mockDelayTimeInMs);
      yield SplashEnd();
    }
  }
}

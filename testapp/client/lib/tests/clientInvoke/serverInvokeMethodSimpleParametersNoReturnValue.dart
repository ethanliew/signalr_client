import 'package:client/tests/test.dart';
import 'package:client/views/pages/testsPageViewModel.dart';
import 'package:signalr_client/signalr_client.dart';

class ServerInvokeMethodSimpleParametersNoReturnValue extends Test {
  // Properties

  // Methods
  ServerInvokeMethodSimpleParametersNoReturnValue(HubConnectionProvider hubConnectionProvider, ILogger logger)
      : super(hubConnectionProvider, logger, "Server Invokes method: 'ServerInvokeMethodSimpleParametersNoReturnValue");

  @override
  Future<void> executeTest(HubConnection hubConnection) async {
    hubConnection.on("ServerInvokeMethodSimpleParametersNoReturnValue", _handleServerInvokeMethodSimpleParametersNoReturnValue);
    try {
      await hubConnection.invoke("ServerInvokeMethodSimpleParametersNoReturnValue");
    } finally {
      hubConnection.off("ServerInvokeMethodSimpleParametersNoReturnValue", method: _handleServerInvokeMethodSimpleParametersNoReturnValue);
    }
  }

  void _handleServerInvokeMethodSimpleParametersNoReturnValue(List<Object> parameters) {

    final paramValues = new StringBuffer("Parameters: ");
    for(int i = 0; i < parameters.length; i++){
      final value = parameters[i];
      paramValues.write( "$i => $value, ");
    }

    logger.log(LogLevel.Information, "From Callback: Server invoked method 'ServerInvokeMethodSimpleParametersNoReturnValue': " + paramValues.toString());
  }
}

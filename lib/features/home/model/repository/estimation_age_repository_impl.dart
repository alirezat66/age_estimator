import 'dart:isolate';

import 'package:age_estimator/core/extensions/string_ext.dart';
import 'package:age_estimator/core/network/app_client.dart';
import 'package:age_estimator/features/home/model/data/estimated_age_model.dart';
import 'package:age_estimator/features/home/model/repository/estimation_age_repository.dart';

class EstimationAgeRepositoryImpl implements EstimationAgeRepository {
  final AppClient _appClient;
  EstimationAgeRepositoryImpl(AppClient appClient) : _appClient = appClient;
  @override
  Future<EstimatedAgeModel> getEstimatedAge(String name) async {
    try {
      final response =
          await _appClient.get('?name=$name'.agifyUri, isUsingCache: true);
      final estimatedAgeModel = EstimatedAgeModel.fromMap(response.body.toMap);
      return estimatedAgeModel;
    } catch (e) {
      throw Exception(e);
    }
  }

  // the bellow method is just for presenting my isolates knowledge
  @override
  Future<EstimatedAgeModel> getEstimatedAgeIsolate(String name) async {
    final receivePort = ReceivePort();
    try {
      // create an isolate and listen for the message
      final isolate = await Isolate.spawn(fetchUrl, receivePort.sendPort);
      final sendPort = await receivePort.first as SendPort;

      // send the url and receive port for responses
      final responsePort = ReceivePort();
      sendPort.send(['?name=$name'.agifyUri, receivePort.sendPort]);

      // Receive the response from the isolate
      final response = await responsePort.first;
      isolate.kill();
      if (response is Map<String, dynamic>) {
        return EstimatedAgeModel.fromMap(response);
      } else {
        throw Exception(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  void fetchUrl(SendPort sendPort) async {
    // Receive the message from the main isolate
    final port = ReceivePort();
    sendPort.send(port.sendPort);

    await for (final message in port) {
      var url = message[0];
      SendPort replyTo = message[1];
      try {
        final response = await _appClient.get(url, isUsingCache: true);
        replyTo.send(response.body.toMap);
      } catch (e) {
        replyTo.send(e);
      }
    }
  }
}

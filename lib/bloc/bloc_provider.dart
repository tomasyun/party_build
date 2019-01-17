import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:party_build/api/global_api.dart';
import 'package:rxdart/rxdart.dart';

class BlocProvider<T> {
  final _api = new GlobalApi();
  final _streamController = new PublishSubject<T>();

  Widget streamBuild({
    T initData,
    Function success,
    Function error,
    Function empty,
    Function loading,
    Function start,
    Function finished,
  }) {
    return StreamBuilder(
        stream: _streamController.stream,
        initialData: initData,
        builder: (context, snapshot) {
          if (finished != null) {
            finished();
          }
          if (snapshot.hasData) {
            if (success != null) return success(snapshot.data);
          } else if (snapshot.hasError) {
            final errorStr = snapshot.error;
            if (errorStr == empty) {
              if (empty != null) return empty();
            } else {
              if (error != null) return error(errorStr);
            }
          } else {
//            if (loading != null) return loading();
            if (start != null) return start();
          }
        });
  }

  void doRequest({Response response, Function dispose}) async {
    _api.doRequest(
        response: response,
        success: (map) {
          _streamController.sink.add(dispose(map));
        },
        error: (errorMsg) {
          _streamController.sink.addError(errorMsg, null);
        },
        empty: () {
          _streamController.sink.addError("");
        });
  }

  void dispose() {
    if (!_streamController.isClosed) {
      _streamController.close();
    }
  }
}

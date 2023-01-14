import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:suitmedia_question_1/models/model_list.dart';

import '../enum.dart';

class ResultData {
  DataStatus status = DataStatus.unavailable;
  List<Datum?> data = [];

  ResultData(this.status, this.data);
}

Future<ResultData?> getDataReqres(int pages) async {
  try {
    var response = await Dio().get('https://reqres.in/api/users?page=$pages');
    if (response.statusCode == 200) {
      if (kDebugMode) (response.data);

      var dataModel = ModelList.fromJson(response.data);
      return ResultData(DataStatus.available, dataModel.data);
    } else if (response.statusCode == 404) {
      return ResultData(DataStatus.notfound, []);
    } else {
      return ResultData(DataStatus.unavailable, []);
    }
  } catch (e) {
    return ResultData(DataStatus.unavailable, []);
  }
}

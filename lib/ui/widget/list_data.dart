import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:suitmedia_question_1/enum.dart';
import 'package:suitmedia_question_1/services/api_services.dart';

import '../../models/model_list.dart';
import 'item_list.dart';

class ListData extends StatefulWidget {
  final List<Datum?> initData;
  const ListData({super.key, required this.initData});

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int pages = 2;
  late List<Datum?> data;

  @override
  void initState() {
    super.initState();
    data = widget.initData;
  }

  void _onLoading() async {
    if (kDebugMode) {
      print("LOADING");
    }

    ResultData? resultData = await getDataReqres(pages);

    if (resultData?.status == DataStatus.available) {
      data.addAll(resultData?.data as List<Datum?>);
      setState(() {
        _refreshController.loadComplete();
      });

      pages++;
    } else {
      setState(() {
        _refreshController.loadFailed();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullUp: true,
      enablePullDown: false,
      physics: const BouncingScrollPhysics(),
      footer: const ClassicFooter(loadStyle: LoadStyle.ShowWhenLoading),
      controller: _refreshController,
      onLoading: _onLoading,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: ((context, index) {
          return listItem(data[index], () {
            Navigator.pop(
              context,
              "${data[index]?.firstName} ${data[index]?.lastName}",
            );
          });
        }),
      ),
    );
  }
}

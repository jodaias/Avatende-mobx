import 'package:avatende/app/pages/relatory/widgets/button_widget.dart';
import 'package:avatende/app/pages/stores/relatory/relatory_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class DateRangePickerWidget extends StatefulWidget {
  @override
  _DateRangePickerWidgetState createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  final relatoryStore = GetIt.I<RelatoryStore>();

  String getFrom() {
    if (relatoryStore.dateRange == null) {
      return 'De: ';
    } else {
      relatoryStore.setSelectedStartDate(relatoryStore.dateRange.start);
      return DateFormat('dd/MM/yyyy').format(relatoryStore.dateRange.start);
    }
  }

  String getUntil() {
    if (relatoryStore.dateRange == null) {
      return 'Até: ';
    } else {
      relatoryStore.setSelectedEndDate(relatoryStore.dateRange.end);
      return DateFormat('dd/MM/yyyy').format(relatoryStore.dateRange.end);
    }
  }

  @override
  Widget build(BuildContext context) => HeaderWidget(
        title: 'Intervalo de datas: ',
        child: Row(
          children: [
            Expanded(
              child: Observer(builder: (_) {
                return ButtonWidget(
                    text: getFrom(),
                    onClicked: () {
                      //                 WidgetsBinding.instance.addPostFrameCallback((_) {
                      //   // Do everything you want here...
                      // });
                      pickDateRange(context);
                    });
              }),
            ),
            const SizedBox(width: 8),
            Icon(Icons.arrow_forward, color: Colors.purple[500]),
            const SizedBox(width: 8),
            Expanded(
              child: Observer(builder: (_) {
                return ButtonWidget(
                  text: getUntil(),
                  onClicked: () => pickDateRange(context),
                );
              }),
            ),
          ],
        ),
      );

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
        start: DateTime.now().add(Duration(hours: 24 * 7 * -1)),
        end: DateTime.now());
    final newDateRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime(2019, 10),
        lastDate: DateTime.now(),
        initialDateRange: relatoryStore.dateRange ?? initialDateRange);

    if (newDateRange == null) return;

    relatoryStore.setDateRange(newDateRange);
  }
}

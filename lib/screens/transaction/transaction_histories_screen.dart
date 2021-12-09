import 'package:crypto_tracker/repos/models/transaction.dart';
import 'package:crypto_tracker/repos/remote/crypto_repository.dart';
import 'package:crypto_tracker/screens/transaction/transaction_card.dart';
import 'package:crypto_tracker/screens/transaction/transaction_histories_bloc.dart';
import 'package:crypto_tracker/screens/transaction/transaction_histories_event.dart';
import 'package:crypto_tracker/screens/transaction/transaction_histories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TransactionHistoriesScreen extends StatefulWidget {
  const TransactionHistoriesScreen({Key? key}) : super(key: key);

  @override
  State<TransactionHistoriesScreen> createState() =>
      _TransactionHistoriesScreenState();
}

class _TransactionHistoriesScreenState
    extends State<TransactionHistoriesScreen> {
  late TransactionHistoriesBloc _bloc;
  List<Transaction> _transactions = [];
  bool _showDateFilter = false;

  List<Widget> _dateFilter() {
    return [
      SfDateRangePicker(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectionColor: Theme.of(context).primaryColor,
        startRangeSelectionColor: Theme.of(context).primaryColor,
        endRangeSelectionColor: Theme.of(context).primaryColor,
        todayHighlightColor: Theme.of(context).primaryColor,
        rangeSelectionColor: Theme.of(context).primaryColor.withOpacity(0.1),
        selectionTextStyle: TextStyle(
          color: Theme.of(context).cardColor,
        ),
        rangeTextStyle: TextStyle(
          color: Theme.of(context).textTheme.bodyText1!.color,
        ),
        monthCellStyle: DateRangePickerMonthCellStyle(
          textStyle: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
          disabledDatesTextStyle: TextStyle(
            color:
                Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5),
          ),
          todayTextStyle: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        monthViewSettings: DateRangePickerMonthViewSettings(
          viewHeaderStyle: DateRangePickerViewHeaderStyle(
            textStyle: TextStyle(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
            ),
          ),
        ),
        headerStyle: DateRangePickerHeaderStyle(
          textStyle: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
        yearCellStyle: DateRangePickerYearCellStyle(
          textStyle: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
          todayTextStyle: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
          disabledDatesTextStyle: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
          leadingDatesTextStyle: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
        onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
          _bloc.add(ChangeDateFilter(args));
        },
        selectionMode: DateRangePickerSelectionMode.range,
        maxDate: DateTime.now(),
        initialSelectedRange: PickerDateRange(
            DateTime.now().subtract(const Duration(days: 4)),
            DateTime.now().add(const Duration(days: 3))),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              _bloc.add(ToggleDateFilter(!_showDateFilter));
              _bloc.add(SubmitDateFilter());
            },
            child: Container(
              child: Text(
                "Apply",
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontWeight: FontWeight.bold),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              _bloc.add(ToggleDateFilter(!_showDateFilter));
              _bloc.add(ClearDateFilter());
            },
            child: Container(
              child: Text(
                "Show all",
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontWeight: FontWeight.bold),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          )
        ],
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionHistoriesBloc>(
      create: (context) => TransactionHistoriesBloc(
          RepositoryProvider.of<CryptoRepository>(context))
        ..add(TransactionHistoriesInitializeEvent()),
      child: BlocConsumer<TransactionHistoriesBloc, TransactionHistoriesState>(
        listener: _setListener,
        builder: (context, state) {
          _bloc = BlocProvider.of<TransactionHistoriesBloc>(context);
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date",
                      style: TextStyle(
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(0.5),
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "All",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            _bloc.add(ToggleDateFilter(!_showDateFilter));
                          },
                          child: Icon(
                            Icons.calendar_today_outlined,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    if (_showDateFilter) ..._dateFilter(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _transactions.length,
                        itemBuilder: (context, index) {
                          final transaction = _transactions[index];
                          return TransactionCard(transaction);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

extension ListenerStateHandler on _TransactionHistoriesScreenState {
  _setListener(BuildContext context, TransactionHistoriesState state) {
    if (state is FetchedTransactionHistories) {
      _transactions = state.transactions;
    }
    if (state is ShowDateFilter) {
      _showDateFilter = state.shouldShow;
    }
  }
}

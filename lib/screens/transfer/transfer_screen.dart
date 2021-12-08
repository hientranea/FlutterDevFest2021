import 'package:crypto_tracker/config/crypto_tracker_color.dart';
import 'package:crypto_tracker/utils/utils.dart';
import 'package:flutter/material.dart';

enum FormMode { send, request }

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  static const String routeName = '/transfer';

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  FormMode _formMode = FormMode.send;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Transfer',
          style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
        ),
        iconTheme: IconThemeData(
          color: isDarkMode()
              ? const Color(0xFFF6F6F6)
              : CryptoTrackerColors.heading,
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _formMode = FormMode.send;
                          });
                        },
                        child: const Text('Send'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            _formMode == FormMode.send
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).disabledColor,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                color: _formMode == FormMode.send
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _formMode = FormMode.request;
                          });
                        },
                        child: const Text('Request'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            _formMode == FormMode.request
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).disabledColor,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                color: _formMode == FormMode.request
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                const FieldTitle(
                  label: 'Select Digital Assets',
                ),
                const CustomTextField(),
                const SizedBox(height: 40),
                const FieldTitle(
                  label: 'How Much?',
                ),
                const CustomTextField(),
                const SizedBox(height: 40),
                FieldTitle(
                  label: _formMode == FormMode.send
                      ? 'Receiver Name'
                      : 'You Want To Request',
                ),
                const CustomTextField(),
                const SizedBox(height: 40),
                FieldTitle(
                  label: _formMode == FormMode.send
                      ? 'Receiver Account Number'
                      : 'His Email',
                ),
                const CustomTextField(),
                const SizedBox(height: 40),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _formMode = FormMode.request;
                      });
                    },
                    child: Text(
                      _formMode == FormMode.send ? 'Send Now' : 'Send Request',
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FieldTitle extends StatelessWidget {
  final String label;
  const FieldTitle({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(label),
      alignment: Alignment.topLeft,
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => TextField(
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color:
                  isDarkMode() ? Colors.white : Theme.of(context).disabledColor,
            ),
          ),
        ),
      );
}

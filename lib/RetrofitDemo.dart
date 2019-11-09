import 'package:floor_demo/retrofit/SubscriptionViewModel.dart';
import 'package:flutter/material.dart';


class RetrofitDemo extends StatefulWidget {
  @override
  _RetrofitDemoState createState() => _RetrofitDemoState();
}

class _RetrofitDemoState extends State<RetrofitDemo> {

  TextEditingController textEditingController = new TextEditingController();

  String emailErrorText;

  SubscriptionViewModel _viewModel;

  @override
  void initState() {
    // TODO: implement initState
    textEditingController.addListener(() =>
        _viewModel.inputMailText.add(textEditingController.text));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: StreamBuilder<String>(
            stream: _viewModel.outputErrorText,
            builder: (context, snapshot) {
              return TextFormField(
                  controller: textEditingController,
                 decoration: InputDecoration(
                     hintText: "Email",
                     errorText: snapshot.data
                 ),);
            },
          ),
        ),
       /* StreamBuilder(
            stream: _viewModel.outPutIsButtonEnabled,
            builder: (context, snapshot) {
              return SubmitButton(enabled: snapshot.data ?? false);
            }),*/
      ],
    );
  }
}

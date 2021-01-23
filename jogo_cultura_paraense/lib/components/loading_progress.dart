import 'package:flutter/material.dart';

class LoadingProgress extends StatelessWidget {
  final bool _loadingFailed;
  final Function _retryCallBack;
  final Color _retryColor;
  const LoadingProgress({
    bool loadingFailed = false,
    Function retryCallBack,
    Color retryColor = Colors.white,
    Key key,
  })  : _loadingFailed = loadingFailed,
        _retryCallBack = retryCallBack,
        _retryColor = retryColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_loadingFailed) {
      return Center(
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Icon(Icons.refresh, color: _retryColor),
          onPressed: () {
            if (_retryCallBack == null) {
              return null;
            } else {
              _retryCallBack();
            }
          },
        ),
      );
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            backgroundColor: Colors.white,
            strokeWidth: 3,
          )
        ],
      ),
    );
  }
}

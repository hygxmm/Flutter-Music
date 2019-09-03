import 'package:flutter/material.dart';

class Toast {
  static void show(BuildContext context,String message,{int duration}){
    OverlayEntry entry = OverlayEntry(
      builder: (BuildContext context) {
        return Container(
          color: Colors.transparent,
          alignment: Alignment.center,
          child: Center(
            child: Container(
              color: Colors.black12,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Material(
                  color: Colors.transparent,
                  child: Text(message),
                ),
              ),
            ),
          ),
        );
      },
    );
    Overlay.of(context).insert(entry);
    Future.delayed(Duration(seconds: duration ?? 2)).then((value){
      entry.remove();
    });
  }
}

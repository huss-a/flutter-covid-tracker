import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocationTitle extends StatefulWidget {
  final String _title;
  final DateTime _date;
  LocationTitle(this._title, this._date);
  @override
  _LocationTitleState createState() => _LocationTitleState();
}

class _LocationTitleState extends State<LocationTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Column(
        children: [
          Row(
            //inline icon with text
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Icon(
                widget._title == "Global" ? Icons.public : Icons.flag,
                size: 35,
              ),
              Text(
                " " +
                    (widget._title.length > 19
                        ? widget._title.substring(0, 16) + "..."
                        : widget._title),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
                style: TextStyle(
                  fontSize: widget._title.length < 15 ? 33 : 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.alarm,
                color: Colors.grey[700],
              ),
              Text(
                " ${DateFormat.yMMMEd().format(widget._date)} ${DateFormat.jms().format(widget._date)}",
                style: TextStyle(fontSize: 15, color: Colors.grey[700]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

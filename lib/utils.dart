import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:tinycolor/tinycolor.dart';

class Utils {
  static String getFileNameWithExtension(File file) {
    if (file.existsSync()) {
      //To get file name without extension
      //path.basenameWithoutExtension(file.path);

      //return file with file extension
      return path.basename(file.path);
    } else {
      return null;
    }
  }

  static Color cardColor(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;

    if (darkModeOn) {
      return TinyColor(Theme.of(context).scaffoldBackgroundColor)
          .darken()
          .color;
    } else {
      return TinyColor(Theme.of(context).scaffoldBackgroundColor)
          .lighten()
          .color;
    }
  }

  static String getFileSize(File file) {
    if (file.existsSync()) {
      //To get file name without extension
      //path.basenameWithoutExtension(file.path);
      int fileSizeInBytes = file.lengthSync();
      var fileSizeInKB = fileSizeInBytes / 1024;
      // Convert the KB to MegaBytes (1 MB = 1024 KBytes)
      var fileSizeInMB = fileSizeInKB / 1024;
      //return file with file extension
      return fileSizeInMB.toStringAsFixed(2) + ' MB';
    } else {
      return null;
    }
  }

  static RegExp intRegex() {
    return RegExp(r'[^0-9]');
  }

  static setBarAndNavColor(BuildContext context, {Color backgroundColor}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        systemNavigationBarColor: backgroundColor ??
            Theme.of(context).bottomNavigationBarTheme.backgroundColor));
  }

  static String currentDayofWeek() {
    var date = DateTime.now();
    return DateFormat('EEEE').format(date);
  }

  static String currentDayOfMonth({DateTime dateTime}) {
    var date = dateTime ?? DateTime.now();
    return DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY).format(date);
  }

  static Color barcolor(BuildContext context) {
    final ThemeData mode = Theme.of(context);
    Brightness whichMode = mode.brightness;
    switch (whichMode) {
      case Brightness.dark:
        return TinyColor(ThemeData.dark().scaffoldBackgroundColor)
            .darken(10)
            .color;
      case Brightness.light:
        return TinyColor(Theme.of(context).scaffoldBackgroundColor)
            .lighten(10)
            .color;
        break;
      default:
        return TinyColor(Theme.of(context).scaffoldBackgroundColor)
            .lighten(10)
            .color;
    }
  }
}

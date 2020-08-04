import 'dart:async';
import 'dart:convert';

import 'package:after_init/after_init.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:xournalpp/generated/l10n.dart';
import 'package:xournalpp/main.dart';
import 'package:xournalpp/pages/CanvasPage.dart';
import 'package:xournalpp/src/XppFile.dart';
import 'package:xournalpp/src/conditional/open_file/open_file_generic.dart'
    if (dart.library.html) 'package:xournalpp/src/conditional/open_file/open_file_web.dart'
    if (dart.library.io) 'package:xournalpp/src/conditional/open_file/open_file_io.dart';
import 'package:xournalpp/src/globals.dart';
import 'package:xournalpp/widgets/DropFile.dart';
import 'package:xournalpp/widgets/drawer.dart';

class OpenPage extends StatefulWidget {
  @override
  _OpenPageState createState() => _OpenPageState();
}

class _OpenPageState extends State<OpenPage> with AfterInitMixin {
  bool _loadedRecent = false;
  List recentFiles = [];
  Completer<BuildContext> scaffoldCompleter = Completer();

  List<SharedMediaFile> _sharedFiles;
  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      String jsonData = prefs.getString(PreferencesKeys.kRecentFiles);
      if (jsonData != null) {
        recentFiles = (jsonDecode(jsonData) as List).reversed.toList();
      }
      setState(() {
        _loadedRecent = true;
      });
    });
    super.initState();
  }

  @override
  void didInitState() {
    scaffoldCompleter.complete(context);
    try {
      // For sharing images coming from outside the app while the app is in the memory
      ReceiveSharingIntent.getMediaStream().listen(
          (List<SharedMediaFile> value) {
        setState(() {
          _sharedFiles = value;
          receivedShareNotification(value);
        });
      }, onError: (err) {
        print("getIntentDataStream error: $err");
      });

      // For sharing images coming from outside the app while the app is closed
      ReceiveSharingIntent.getInitialMedia()
          .then((List<SharedMediaFile> value) {
        setState(() {
          _sharedFiles = value;
          receivedShareNotification(value);
        });
      }).catchError((e) {});

      // For sharing or opening urls/text coming from outside the app while the app is in the memory
      ReceiveSharingIntent.getTextStream().listen((String value) {
        receivedShareNotification(value);
      }, onError: (err) {
        print("getLinkStream error: $err");
      });

      // For sharing or opening urls/text coming from outside the app while the app is closed
      ReceiveSharingIntent.getInitialText().then((String value) {
        receivedShareNotification(value);
      }).catchError((e) {});
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Xournal++'),
      ),
      body: ListView(
        children: [
          if (kIsWeb) DropFile(),
          ListTile(
            title: Text(
              S.of(context).recentFiles,
              style: Theme.of(context).textTheme.headline3,
            ),
          )
        ]..addAll(_loadedRecent
            ? generateRecentFileList(recentFiles, context)
            : [Center(child: CircularProgressIndicator())]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CanvasPage())),
        label: Text(S.of(context).newNotebook),
        icon: Icon(Icons.note_add),
      ),
    );
  }

  void receivedShareNotification(dynamic data) async {
    if (data == null ||
        lastIntentData == data ||
        data is List &&
            lastIntentData is List &&
            data[0].path == lastIntentData[0].path) return;
    lastIntentData = data;
    if (data is String) {
      /// checking if we were redirected from the web site
      if (data.startsWith('http')) {
        scaffoldCompleter.future.then((scaffoldContext) =>
            Scaffold.of(scaffoldContext).showSnackBar(SnackBar(
              content: Text(S.of(context).youveBeenRedirectedToTheLocalApp),
            )));
        return;
      } else {
        /// seems to be an opened file
        /// ... which is awfully encoded as a content:// URI using the path as **queryComponent** instead of as **path** (why???)
        String path = '/' +
            Uri.decodeQueryComponent(
                Uri.parse(data as String).path.substring(1));
        print(path);
        data = [
          SharedMediaFile(
              path, base64Encode(kTransparentImage), null, SharedMediaType.FILE)
        ];
        _sharedFiles = data;
      }
    }
    if (data is List) {
      bool _aborted = false;
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(S.of(context).openingFile),
                content: Text(S.of(context).opening +
                    ' ${data[0].path.substring(data[0].path.lastIndexOf('/') + 1, data[0].path.lastIndexOf('.'))} ...'),
                actions: [
                  FlatButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(S.of(context).background),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _aborted = true;
                    },
                    child: Text(S.of(context).abort),
                  )
                ],
              ));
      try {
        XppFile file = await XppFile.fromFilePickerCross(
            openFileByUri(_sharedFiles[0].path), (percentage) => null);
        if (_aborted) return;
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => CanvasPage(
                  file: file,
                )));
      } catch (e) {
        Navigator.of(context).pop();
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(S.of(context).errorOpeningFile),
                  content: SelectableText(
                      S.of(context).imVerySorryButICouldntReadTheFile +
                          _sharedFiles[0].path +
                          S.of(context).areYouSureIHaveThePermissionAndAreYou +
                          '\n${e.toString()}'),
                  actions: [
                    FlatButton(
                        onPressed: () => Clipboard.setData(
                            ClipboardData(text: e.toString())),
                        child: Text(S.of(context).copyErrorMessage)),
                    FlatButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(S.of(context).okay),
                    ),
                  ],
                ));
      }
    } else {
      print('Unsupported runtimeType: ${data.runtimeType.toString()}');
    }
  }
}

Iterable<Widget> generateRecentFileList(List files, BuildContext context) {
  return List.generate(files.length > 0 ? files.length : 1, (index) {
    if (files.length > 0) {
      Map fileInfo = files[index];
      return ListTile(
        isThreeLine: true,
        title: Container(),
        leading: AspectRatio(
          aspectRatio: 1,
          child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(maxHeight: 256, minHeight: 128),
            child: Image.memory(base64Decode(fileInfo['preview'])),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        subtitle: Text(
          fileInfo['name'],
          style: Theme.of(context).textTheme.headline3.copyWith(
              color: Theme.of(context).textTheme.bodyText1.color,
              fontSize: kEmphasisFontSize * kFontSizeDivision),
        ),
        trailing: Tooltip(
          child: Icon(
            Icons.info_outline,
          ),
          message: fileInfo['path'],
        ),
        onTap: () async {
          XppFile file = await XppFile.fromFilePickerCross(
              openFileByUri(fileInfo['path']), (percent) {});
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CanvasPage(file: file)));
        },
      );
    } else {
      return ListTile(
        leading: Icon(Icons.info),
        title: Text(S.of(context).noRecentFiles),
        trailing: IconButton(
          icon: Icon(Icons.note_add),
          tooltip: S.of(context).newNotebook,
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CanvasPage())),
        ),
      );
    }
  });
}

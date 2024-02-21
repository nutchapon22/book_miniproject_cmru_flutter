import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Reader extends StatefulWidget {
  const Reader({
    super.key,
    required this.path,
    required this.title,
  });

  final String path;
  final String title;

  @override
  State<Reader> createState() => _ReaderState();
}

class _ReaderState extends State<Reader> {
  int pages = 0;
  bool isReady = false;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SfPdfViewer.asset(
          'assets/${widget.path}',
          key: _pdfViewerKey,
        ),
      ),
    );
  }
}

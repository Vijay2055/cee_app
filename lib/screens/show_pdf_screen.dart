import 'package:flutter/material.dart';
import 'package:psc_app/widgets/custom_app_bar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ShowPdfScreen extends StatelessWidget {
  const ShowPdfScreen({super.key, required this.pdfUrl, required this.title});
  final String pdfUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: title),
          Expanded(
            child: SfPdfViewer.network(
              pdfUrl,
              canShowScrollHead: false, // hides scroll head for cleaner UX
              canShowScrollStatus: false,
              enableDoubleTapZooming: true,
              pageLayoutMode: PdfPageLayoutMode.continuous,
            ),
          ),
        ],
      ),
    );
  }
}

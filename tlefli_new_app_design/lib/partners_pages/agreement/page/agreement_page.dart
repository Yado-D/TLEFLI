import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Agreement_page extends StatelessWidget {
  const Agreement_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBars(context, 'Agreements'),
      body: SfPdfViewer.asset('assets/agreement/test.pdf'),
    );
  }
}

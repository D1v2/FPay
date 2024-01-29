import 'package:flutter/services.dart';
import 'package:fpay/Network/Models/PayoutReportData.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../FunctionUtils.dart';
import '../ImageConstant.dart';

class UpiPdf {
  static Future<pw.Document> generatePdf(
      PayoutReportData data, int amount) async {
    final ByteData image = await rootBundle.load(ImageConstant.receiptLogo);
    Uint8List imageData = (image).buffer.asUint8List();
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Text('Receipt No. ${data.id}',
                style:
                pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
            pw.Container(
                margin: const pw.EdgeInsets.only(bottom: 5),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Container(
                          padding: const pw.EdgeInsets.all(10),
                          decoration: pw.BoxDecoration(
                              borderRadius: pw.BorderRadius.circular(0),
                              border: pw.Border.all(
                                  color: PdfColors.black, width: 1)),
                          child: pw.Image(pw.MemoryImage(imageData)),
                          height: 70,
                          width: 150),
                      pw.Container(
                          width: 330,
                          margin: const pw.EdgeInsets.only(left: 5),
                          padding: const pw.EdgeInsets.all(10),
                          decoration: pw.BoxDecoration(
                              borderRadius: pw.BorderRadius.circular(0),
                              border: pw.Border.all(
                                  color: PdfColors.black, width: 1)),
                          child: pw.Column(children: [
                            pw.Text('${data.memberFirmName}',
                                style: pw.TextStyle(
                                    fontSize: 16,
                                    fontWeight: pw.FontWeight.bold)),
                            pw.Text('Mobile No: ${data.memberMobile}',
                                style: pw.TextStyle(
                                    fontSize: 12,
                                    fontWeight: pw.FontWeight.bold)),
                            pw.Text(
                                'Authorised by: F-Pay Communication Pvt Ltd',
                                style: pw.TextStyle(
                                    fontSize: 14,
                                    fontWeight: pw.FontWeight.bold))
                          ]))
                    ])),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                pw.Container(
                    padding: const pw.EdgeInsets.all(10),
                    decoration: pw.BoxDecoration(
                        borderRadius: pw.BorderRadius.circular(0),
                        border:
                        pw.Border.all(color: PdfColors.black, width: 1)),
                    child: pw.Text('Member Id',
                        style: pw.TextStyle(
                            fontSize: 12, fontWeight: pw.FontWeight.bold)),
                    width: 170,
                    height: 35),
                pw.Container(
                    width: 310,
                    height: 35,
                    margin: const pw.EdgeInsets.only(left: 5),
                    padding: const pw.EdgeInsets.all(10),
                    decoration: pw.BoxDecoration(
                        borderRadius: pw.BorderRadius.circular(0),
                        border:
                        pw.Border.all(color: PdfColors.black, width: 1)),
                    child: pw.Text(data.memberID ?? "NA",
                        style: pw.TextStyle(
                            fontSize: 12, fontWeight: pw.FontWeight.bold)))
              ],
            ),
            pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 5, top: 5),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Container(
                      padding: const pw.EdgeInsets.all(10),
                      decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(0),
                          border:
                          pw.Border.all(color: PdfColors.black, width: 1)),
                      child: pw.Text('Member Name',
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold)),
                      height: 35,
                      width: 170),
                  pw.Container(
                      width: 310,
                      height: 35,
                      margin: const pw.EdgeInsets.only(left: 5),
                      padding: const pw.EdgeInsets.all(10),
                      decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(0),
                          border:
                          pw.Border.all(color: PdfColors.black, width: 1)),
                      child: pw.Text(data.memberName ?? "NA",
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold)))
                ],
              ),
            ),
            pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 5),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Container(
                      padding: const pw.EdgeInsets.all(10),
                      decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(0),
                          border:
                          pw.Border.all(color: PdfColors.black, width: 1)),
                      child: pw.Text('Beneficiary Name',
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold)),
                      height: 35,
                      width: 170),
                  pw.Container(
                      width: 310,
                      height: 35,
                      margin: const pw.EdgeInsets.only(left: 5),
                      padding: const pw.EdgeInsets.all(10),
                      decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(0),
                          border:
                          pw.Border.all(color: PdfColors.black, width: 1)),
                      child: pw.Text(data.memberName ?? "NA",
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold)))
                ],
              ),
            ),
            pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 5),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Container(
                      padding: const pw.EdgeInsets.all(10),
                      decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(0),
                          border:
                          pw.Border.all(color: PdfColors.black, width: 1)),
                      child: pw.Text('Beneficiary UPI ID',
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold)),
                      height: 35,
                      width: 170),
                  pw.Container(
                      width: 310,
                      height: 35,
                      margin: const pw.EdgeInsets.only(left: 5),
                      padding: const pw.EdgeInsets.all(10),
                      decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(0),
                          border:
                          pw.Border.all(color: PdfColors.black, width: 1)),
                      child: pw.Text(data.number ?? "",
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold)))
                ],
              ),
            ),
            pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 5),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Container(
                      padding: const pw.EdgeInsets.all(10),
                      decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(0),
                          border:
                          pw.Border.all(color: PdfColors.black, width: 1)),
                      child: pw.Text('Service Type',
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold)),
                      height: 35,
                      width: 170),
                  pw.Container(
                      width: 310,
                      height: 35,
                      margin: const pw.EdgeInsets.only(left: 5),
                      padding: const pw.EdgeInsets.all(10),
                      decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(0),
                          border:
                          pw.Border.all(color: PdfColors.black, width: 1)),
                      child: pw.Text("UPI Transfer",
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold)))
                ],
              ),
            ),
            pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 5),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Container(
                      padding: const pw.EdgeInsets.all(10),
                      decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(0),
                          border:
                          pw.Border.all(color: PdfColors.black, width: 1)),
                      child: pw.Text('Transaction Amount',
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold)),
                      height: 35,
                      width: 170),
                  pw.Container(
                      height: 35,
                      width: 310,
                      margin: const pw.EdgeInsets.only(left: 5),
                      padding: const pw.EdgeInsets.all(10),
                      decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(0),
                          border:
                          pw.Border.all(color: PdfColors.black, width: 1)),
                      child: pw.Text('${data.amount ?? "NA"}',
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold)))
                ],
              ),
            ),
            pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 5),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Container(
                      padding: const pw.EdgeInsets.all(10),
                      decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(0),
                          border:
                          pw.Border.all(color: PdfColors.black, width: 1)),
                      child: pw.Text('Convenience Fee',
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold)),
                      height: 35,
                      width: 170),
                  pw.Container(
                      height: 35,
                      width: 310,
                      margin: const pw.EdgeInsets.only(left: 5),
                      padding: const pw.EdgeInsets.all(10),
                      decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(0),
                          border:
                          pw.Border.all(color: PdfColors.black, width: 1)),
                      child: pw.Text('$amount',
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold)))
                ],
              ),
            ),
            pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 5),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Container(
                      padding: const pw.EdgeInsets.all(10),
                      decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(0),
                          border:
                          pw.Border.all(color: PdfColors.black, width: 1)),
                      child: pw.Text('Total Amount',
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold)),
                      height: 35,
                      width: 170),
                  pw.Container(
                      height: 35,
                      width: 310,
                      margin: const pw.EdgeInsets.only(left: 5),
                      padding: const pw.EdgeInsets.all(10),
                      decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(0),
                          border:
                          pw.Border.all(color: PdfColors.black, width: 1)),
                      child: pw.Text('${(data.amount! + amount)}',
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold)))
                ],
              ),
            ),
            pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 5),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Container(
                      padding: const pw.EdgeInsets.all(10),
                      decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(0),
                          border:
                          pw.Border.all(color: PdfColors.black, width: 1)),
                      child: pw.Text('Date & Time',
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold)),
                      height: 35,
                      width: 170),
                  pw.Container(
                      width: 310,
                      height: 35,
                      margin: const pw.EdgeInsets.only(left: 5),
                      padding: const pw.EdgeInsets.all(10),
                      decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(0),
                          border:
                          pw.Border.all(color: PdfColors.black, width: 1)),
                      child: pw.Text(formatDate(data.addDate),
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold)))
                ],
              ),
            ),
            pw.Table.fromTextArray(
              headers: ['Transaction Id', 'Amount', 'Bank RRN', 'Status'],
              data: [
                [data.referenceId ?? "NA", data.amount, data.bankrrn ?? "NA", data.status],
              ],
              border: pw.TableBorder.all(),
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              cellAlignment: pw.Alignment.center,
              cellStyle: const pw.TextStyle(),
              headerHeight: 30,
              cellHeight: 30,
              cellAlignments: {
                0: pw.Alignment.center,
                1: pw.Alignment.center,
                2: pw.Alignment.center,
                3: pw.Alignment.center,
              },
            ),
            pw.Container(
                padding: const pw.EdgeInsets.all(10),
                margin: const pw.EdgeInsets.only(top: 10),
                decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(5),
                    border: pw.Border.all(color: PdfColors.black, width: 1)),
                child: pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Terms & Conditions / Disclaimer"),
                      pw.Text(
                          "1. The Customer Is Fully Responsible for The Accuracy of The Details as Provided by Him Before the Transaction Is Initiated."),
                      pw.Text(
                          "2. If Your Payment Is Pending, You Will Need to Wait For 2 Working Days for Your Operator to Update the Final Status."),
                      pw.Text(
                          "3. Service Charge Of 1% Or Rs 10 (Whichever Is Higher) Inclusive GST Applicable."),
                    ])),
            pw.Container(
                padding: const pw.EdgeInsets.only(
                    left: 25, right: 25, top: 10, bottom: 10),
                margin: const pw.EdgeInsets.only(top: 10),
                decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(5),
                    border: pw.Border.all(color: PdfColors.black, width: 1)),
                child: pw.Text(
                    "*This Is A Computer-Generated Receipt and Does Not Require A Physical Signature*",
                    textAlign: pw.TextAlign.center,
                    style: const pw.TextStyle(color: PdfColors.red)))
          ];
        },
      ),
    );
    return pdf;
  }
}

import 'package:flutter/material.dart';
import 'package:insurance_boost/pages/detail_pages/pdf_detail_page.dart';

class SubmissionDetailPage extends StatefulWidget {
  const SubmissionDetailPage({Key? key}) : super(key: key);

  @override
  _SubmissionDetailPageState createState() => _SubmissionDetailPageState();
}

class _SubmissionDetailPageState extends State<SubmissionDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Submission',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.teal,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'This is TITLE',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    'Status: ',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  StatusTag(
                    color: Colors.red,
                    text: 'Done',
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Uploaded by: USERNAME',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Date: 2020.12.13',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Email: 12001u@maks.com',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Details: This is the example of the introduction of this submission. and all basic elements have been designed on the page.',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(40.0),
                  ),
                  backgroundColor: Colors.teal,
                  primary: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFViewerPage(
                        url:
                            'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.attach_file_sharp),
                    SizedBox(
                      width: 10,
                    ),
                    Text('My Submission File'),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(40.0),
                  ),
                  backgroundColor: Colors.teal,
                  primary: Colors.white,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.book),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Report to My File'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal,
        icon: Icon(Icons.edit),
        label: Text('Edit'),
        onPressed: () {},
      ),
    );
  }
}

class StatusTag extends StatelessWidget {
  final Color color;
  final String text;
  const StatusTag({Key? key, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
          color: color,
          // border: Border.all(color: Colors.teal, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(40))),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

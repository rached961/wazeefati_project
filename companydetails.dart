import 'package:flutter/material.dart';
import 'homepage.dart';

class CompanyDetailsPage extends StatelessWidget {
  final Company company;

  const CompanyDetailsPage(this.company, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(company.name),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(company.description, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Category: ${company.category}',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text('Location: ${company.location}',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text(
              company.remote ? 'Remote jobs available' : 'On-site only',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

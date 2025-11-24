import 'package:flutter/material.dart';
import 'companydetails.dart';

class Company {
  String name;
  String description;
  String category;
  String location;
  bool remote;

  Company(this.name, this.description, this.category, this.location, this.remote);
}

List<Company> companies = [
  Company('TechCorp', 'Technology and software', 'Technology', 'Beirut', true),
  Company('GreenEnergy', 'Renewable energy', 'Energy', 'Tripoli', false),
  Company('EduWorks', 'Education and training', 'Education', 'Beirut', true),
  Company('HealthPlus', 'Medical and health services', 'Health', 'Saida', false),
  Company('MarketHub', 'Retail and commerce', 'Business', 'Zahle', true),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = [
    'All',
    'Technology',
    'Energy',
    'Education',
    'Health',
    'Business',
  ];

  String selectedCategory = 'All';

  List<Company> getFilteredCompanies() {
    List<Company> result = [];
    for (Company c in companies) {
      if (selectedCategory == 'All' || c.category == selectedCategory) {
        result.add(c);
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    List<Company> filteredCompanies = getFilteredCompanies();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Companies & Jobs'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text('Select category', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 5),
            DropdownMenu<String>(
              width: 220,
              initialSelection: selectedCategory,
              onSelected: (value) => setState(() => selectedCategory = value!),
              dropdownMenuEntries: categories
                  .map((c) => DropdownMenuEntry<String>(value: c, label: c))
                  .toList(),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCompanies.length,
                itemBuilder: (context, index) {
                  Company company = filteredCompanies[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(company.name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(company.description,
                            style: const TextStyle(fontSize: 16)),
                        const SizedBox(height: 4),
                        Text('${company.category} • ${company.location}',
                            style: const TextStyle(fontSize: 14)),
                        const SizedBox(height: 6),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    CompanyDetailsPage(company),
                              ),
                            );
                          },
                          child: const Text('View details',
                              style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

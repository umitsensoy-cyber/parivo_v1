import 'package:flutter/material.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {

  final amountController = TextEditingController();
  final descController = TextEditingController();

  DateTime? dueDate;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Gelir / Gider Ekle"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: "Tutar",
              ),
            ),

            TextField(
              controller: descController,
              decoration: const InputDecoration(
                labelText: "Açıklama",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {

                DateTime? picked =
                await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );

                setState(() {
                  dueDate = picked;
                });

              },
              child: const Text("Ödeme Tarihi Seç"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {

                // Firestore save burada olacak

                Navigator.pop(context);

              },
              child: const Text("Kaydet"),
            ),

          ],
        ),
      ),
    );
  }
}

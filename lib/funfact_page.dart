import 'package:flutter/material.dart';
import 'dart:math'; // Import for random number generation
import 'sidemenu.dart';

class FunfactPage extends StatefulWidget {
  const FunfactPage({Key? key}) : super(key: key);

  @override
  _FunfactPageState createState() => _FunfactPageState();
}

class _FunfactPageState extends State<FunfactPage> {
  final List<String> funFacts = [
    'Did you know? The Eiffel Tower can be 15 cm taller during the summer due to heat expansion.',
    'Did you know? Honey never spoils. Archaeologists have found pots of honey in ancient Egyptian tombs that are over 3,000 years old and still perfectly edible.',
    'Did you know? A group of flamingos is called a "flamboyance."',
    'Did you know? Bananas are berries, but strawberries are not.',
    'Did you know? Octopuses have three hearts and blue blood.'
  ];

  String selectedFact = '';

  void _loadFunFact() {
    setState(() {
      // Select a random fact instead of one based on the day
      selectedFact = funFacts[Random().nextInt(funFacts.length)];
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFunFact(); // Load an initial fact
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fun Fact of the Day'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Here\'s a Fun Fact!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Text(
                    selectedFact,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: const Sidemenu(),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadFunFact, // Refresh fact when pressed
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.refresh), // Refresh icon
      ),
    );
  }
}

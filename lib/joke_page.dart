import 'package:flutter/material.dart';
import 'sidemenu.dart';
import 'dart:math'; // Import for generating random numbers

class JokePage extends StatefulWidget {
  const JokePage({super.key});

  @override
  _JokePageState createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  final List<String> jokes = [
    'Why don’t skeletons fight each other? They don’t have the guts.',
    'I told my wife she was drawing her eyebrows too high. She looked surprised.',
    'Why don’t some couples go to the gym? Because some relationships don’t work out.',
    'What do you call fake spaghetti? An impasta!',
    'Why couldn’t the bicycle stand up by itself? It was two tired.'
  ];

  String selectedJoke = '';

  @override
  void initState() {
    super.initState();
    _loadRandomJoke();
  }

  void _loadRandomJoke() {
    final randomIndex = Random().nextInt(jokes.length); // Get a random index
    setState(() {
      selectedJoke = jokes[randomIndex]; // Set the selected joke
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joke of the Day'),
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
                  'Here\'s a Joke for You!',
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
                    selectedJoke,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
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
        onPressed: _loadRandomJoke, // Refresh joke when pressed
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.refresh), // Refresh icon
      ),
    );
  }
}

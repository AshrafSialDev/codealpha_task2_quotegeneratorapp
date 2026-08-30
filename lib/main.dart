import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const RandomQuoteApp());
}

class RandomQuoteApp extends StatelessWidget {
  const RandomQuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Quote Generator',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F5FA),
      ),
      home: const QuoteScreen(),
    );
  }
}

class Quote {
  final String text;
  final String author;

  const Quote({
    required this.text,
    required this.author,
  });
}

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final Random random = Random();

  final List<Quote> quotes = const [
    Quote(
      text: 'The only way to do great work is to love what you do.',
      author: 'Steve Jobs',
    ),
    Quote(
      text: 'Believe you can and you are halfway there.',
      author: 'Theodore Roosevelt',
    ),
    Quote(
      text: 'It always seems impossible until it is done.',
      author: 'Nelson Mandela',
    ),
    Quote(
      text: 'Success is not final, failure is not fatal.',
      author: 'Winston Churchill',
    ),
    Quote(
      text: 'Do what you can, with what you have, where you are.',
      author: 'Theodore Roosevelt',
    ),
    Quote(
      text: 'The future depends on what you do today.',
      author: 'Mahatma Gandhi',
    ),
    Quote(
      text: 'Dream big and dare to fail.',
      author: 'Norman Vincent Peale',
    ),
    Quote(
      text: 'Stay hungry, stay foolish.',
      author: 'Steve Jobs',
    ),
    Quote(
      text: 'Everything you can imagine is real.',
      author: 'Pablo Picasso',
    ),
    Quote(
      text: 'Great things are done by a series of small things brought together.',
      author: 'Vincent van Gogh',
    ),
  ];

  late int currentIndex;

  @override
  void initState() {
    super.initState();

    // Random quote when app opens
    currentIndex = random.nextInt(quotes.length);
  }

  void getNewQuote() {
    int newIndex;

    // Make sure the new quote is different
    do {
      newIndex = random.nextInt(quotes.length);
    } while (newIndex == currentIndex);

    setState(() {
      currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Quote currentQuote = quotes[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Random Quote',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),

              // Quote Icon
              Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.format_quote,
                  size: 42,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 30),

              // Quote Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      '"${currentQuote.text}"',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF25212B),
                      ),
                    ),

                    const SizedBox(height: 25),

                    Container(
                      width: 45,
                      height: 3,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    const SizedBox(height: 18),

                    Text(
                      '— ${currentQuote.author}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // New Quote Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: getNewQuote,
                  icon: const Icon(Icons.refresh),
                  label: const Text(
                    'New Quote',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 2,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                'Tap the button for inspiration',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
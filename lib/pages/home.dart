import 'package:flutter/material.dart';
import '/data/tarotCardModel.dart';
import '/pages/cardTinder.dart';
import '/pages/tarotDetail.dart';
import '../data/tarotBackgroundWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TarotCardModel> _cards = TarotDeck().cards;
  String _searchQuery = '';

  List<TarotCardModel> get _matchingCards {
    final query = _searchQuery.trim().toLowerCase();
    if (query.isEmpty) return [];

    return _cards.where((card) {
      final nameWithArabicNumerals = card.name.replaceAllMapped(
        RegExp(r'\b[IVXLCDM]+\b', caseSensitive: false),
        (match) => _romanToArabic(match.group(0)!),
      );
      return '${card.name} $nameWithArabicNumerals ${card.type} ${card.description} ${card.descriptionR}'
          .toLowerCase()
          .contains(query);
    }).toList();
  }

  String _romanToArabic(String numeral) {
    const values = {
      'I': 1,
      'V': 5,
      'X': 10,
      'L': 50,
      'C': 100,
      'D': 500,
      'M': 1000,
    };
    var total = 0;
    var previousValue = 0;

    for (final character in numeral.toUpperCase().split('').reversed) {
      final value = values[character]!;
      total += value < previousValue ? -value : value;
      previousValue = value;
    }

    return total.toString();
  }

  @override
  Widget build(BuildContext context) {
    final matchingCards = _matchingCards;

    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: TarotPageBackground(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                onChanged: (value) => setState(() => _searchQuery = value),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  suffixIcon: _searchQuery.isEmpty
                      ? null
                      : IconButton(
                          tooltip: 'Clear search',
                          onPressed: () => setState(() => _searchQuery = ''),
                          icon: const Icon(Icons.clear),
                        ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  fillColor: Theme.of(context).colorScheme.surface,
                  filled: true,
                  hintText: 'Search',
                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onSurface,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            if (_searchQuery.trim().isNotEmpty)
              Expanded(
                child: matchingCards.isEmpty
                    ? Center(
                        child: Text(
                          'No cards found',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
                        itemCount: matchingCards.length,
                        itemBuilder: (context, index) {
                          final card = matchingCards[index];
                          return ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.asset(
                                card.imagePath,
                                width: 44,
                                height: 64,
                                cacheWidth:
                                    (44 * MediaQuery.devicePixelRatioOf(
                                      context,
                                    )).round(),
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(card.name),
                            subtitle: Text(card.type),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => tarotDetails(card),
                              ),
                            ),
                          );
                        },
                      ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.onSurface,
              foregroundColor: Theme.of(context).colorScheme.surface,
              minimumSize: const Size.fromHeight(52),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => cardTinder()),
              );
            },
            child: const Text('Start Reading'),
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "TarotAngel",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0.0,
    );
  }
}

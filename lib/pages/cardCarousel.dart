import '/pages/tarotDetail.dart';
import 'package:flutter/material.dart';
import '/data/tarotCardModel.dart';
import '../data/tarotCardWidget.dart';
import '../data/tarotBackgroundWidget.dart';

class cardCarousel extends StatefulWidget {
  const cardCarousel({super.key, required this.number});
  final int number;

  @override
  State<cardCarousel> createState() => _cardCarousel();
}

class _cardCarousel extends State<cardCarousel> {
  final List<TarotCardModel> cardsPicked = [];
  final List<bool> cardFlipped = [];

  @override
  void initState() {
    super.initState();
    final deck = TarotDeck();
    cardsPicked.addAll(deck.drawCard(widget.number));
    cardFlipped.addAll(List<bool>.filled(cardsPicked.length, false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        leading: const BackButton(),
        title: Text(
          'TarotAngel',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: TarotPageBackground(
        child: SafeArea(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount:
                cardsPicked.length +
                (cardFlipped.every((flipped) => flipped) ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == cardsPicked.length) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  child: FilledButton.icon(
                    key: const Key('homeButton'),
                    style: FilledButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onSurface,
                      foregroundColor: Theme.of(context).colorScheme.surface,
                    ),
                    icon: const Icon(Icons.home_outlined),
                    label: const Text('Home'),
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                  ),
                );
              }

              final card = cardsPicked[index];
              final faceImage = card.orientation
                  ? card.imagePath
                  : card.imagePathR;

              return Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (cardFlipped[index])
                      Text(
                        '${card.name} • ${card.orientation ? 'Upright' : 'Reversed'}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    const SizedBox(height: 12),
                    TarotCardWidget(
                      cardFaceImage: faceImage,
                      cardBackImage: 'assets/images/cardFront.png',
                      isFlipped: cardFlipped[index],
                      onFlip: (flipped) {
                        setState(() {
                          cardFlipped[index] = flipped;
                        });
                      },
                      onPressed: cardFlipped[index]
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => tarotDetails(card),
                                ),
                              );
                            }
                          : null,
                    ),
                    const SizedBox(height: 12),
                    if (cardFlipped[index])
                      Text(
                        card.orientation ? card.description : card.descriptionR,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

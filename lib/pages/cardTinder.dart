import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '/pages/cardCarousel.dart';

class cardTinder extends StatefulWidget {
  const cardTinder({super.key});
  @override
  State<cardTinder> createState() => _cardTinder();
}

class _cardTinder extends State<cardTinder> {
  int counter = 0;
  void _addCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(
          'TarotAngel',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          children: [
            Container(child: Text('Cards: $counter')),
            SizedBox(
              height: 460,
              width: 320,
              child: CardSwiper(
                cardBuilder: (context, index, horizontal, vertical) {
                  return ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    child: Image.asset('assets/images/cardFront.png'),
                  );
                },
                cardsCount: 78,
                allowedSwipeDirection: AllowedSwipeDirection.only(
                  left: true,
                  right: true,
                ),
                onSwipe: (previousIndex, currentIndex, direction) {
                  if (direction == CardSwiperDirection.right) {
                    _addCounter();
                  }
                  return true;
                },
              ),
            ),
            const SizedBox(height: 12),
            if (counter > 0)
              SizedBox(
                width: 180,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onSurface,
                    foregroundColor: Theme.of(context).colorScheme.surface,
                    minimumSize: const Size.fromHeight(48),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => cardCarousel(number: counter),
                      ),
                    );
                  },
                  child: const Text('To Reading'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

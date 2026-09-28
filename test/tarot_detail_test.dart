import 'package:final_project/data/tarotCardModel.dart';
import 'package:final_project/pages/tarotDetail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('finds tarot details by matching card id', () {
    final selectedCard = TarotCardModel(
      id: 2,
      name: 'The High Priestess',
      type: 'Major',
      description: '',
      descriptionR: '',
      imagePath: 'assets/images/high_priestess.png',
      imagePathR: 'assets/images/high_priestess_reversed.png',
    );

    final details = tarotDetails(selectedCard).getCardDetails(selectedCard.id);

    expect(details['id'], 2);
    expect((details['description'] as String).isNotEmpty, isTrue);
    expect((details['element'] as String).isNotEmpty, isTrue);
  });
}

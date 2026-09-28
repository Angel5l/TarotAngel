import 'package:flutter/material.dart';
import '/data/tarotCardModel.dart';
import '/data/theme.dart';
import '/data/tarotDetails_json.dart' as tarot_detail_data;

class tarotDetails extends StatelessWidget {
  final TarotCardModel? selectedCard;

  const tarotDetails(this.selectedCard, {super.key});

  Map<String, dynamic> getCardDetails(int id) {
    return tarot_detail_data.tarotDetails.firstWhere(
      (cardDetail) => cardDetail['id'] == id,
      orElse: () => {
        'id': id,
        'element': '',
        'description': '',
        'upright': '',
        'reversed': '',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedDetails = getCardDetails(selectedCard?.id ?? 0);
    final detailDescription = selectedDetails['description'] as String? ?? '';
    final detailElement = selectedDetails['element'] as String? ?? '';
    final detailUpright = selectedDetails['upright'] as String? ?? '';
    final detailReversed = selectedDetails['reversed'] as String? ?? '';

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(Icons.arrow_back, color: appTheme.colorScheme.onSurface),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: appTheme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: selectedCard!.orientation
                ? AssetImage(selectedCard!.imagePath)
                : AssetImage(selectedCard!.imagePathR),
            fit: BoxFit.cover,
            opacity: 0.6,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    selectedCard!.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Theme(
                    data: appTheme.copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      initiallyExpanded: false,
                      title: Text(
                        'Description',
                        style: appTheme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      leading: CircleAvatar(
                        radius: 12,
                        backgroundColor: () {
                          switch (detailElement.toLowerCase()) {
                            case 'water':
                              return Colors.blue;
                            case 'fire':
                              return Colors.red;
                            case 'earth':
                              return Colors.green;
                            case 'air':
                              return Colors.amber;
                            default:
                              return Colors.grey;
                          }
                        }(),
                      ),
                      childrenPadding: const EdgeInsets.fromLTRB(
                        AppSpacing.md,
                        0,
                        AppSpacing.md,
                        AppSpacing.md,
                      ),
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            detailDescription,
                            style: appTheme.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Theme(
                    data: appTheme.copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      initiallyExpanded: false,
                      title: Text(
                        'Upright Meaning',
                        style: appTheme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      leading: CircleAvatar(
                        radius: 12,
                        backgroundColor: () {
                          switch (detailElement.toLowerCase()) {
                            case 'water':
                              return Colors.blue;
                            case 'fire':
                              return Colors.red;
                            case 'earth':
                              return Colors.green;
                            case 'air':
                              return Colors.amber;
                            default:
                              return Colors.grey;
                          }
                        }(),
                      ),
                      childrenPadding: const EdgeInsets.fromLTRB(
                        AppSpacing.md,
                        0,
                        AppSpacing.md,
                        AppSpacing.md,
                      ),
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            detailUpright,
                            style: appTheme.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Theme(
                    data: appTheme.copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      initiallyExpanded: false,
                      title: Text(
                        'Reversed Meaning',
                        style: appTheme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      leading: CircleAvatar(
                        radius: 12,
                        backgroundColor: () {
                          switch (detailElement.toLowerCase()) {
                            case 'water':
                              return Colors.blue;
                            case 'fire':
                              return Colors.red;
                            case 'earth':
                              return Colors.green;
                            case 'air':
                              return Colors.amber;
                            default:
                              return Colors.grey;
                          }
                        }(),
                      ),
                      childrenPadding: const EdgeInsets.fromLTRB(
                        AppSpacing.md,
                        0,
                        AppSpacing.md,
                        AppSpacing.md,
                      ),
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            detailReversed,
                            style: appTheme.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

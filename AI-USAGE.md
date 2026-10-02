# AI usage

This project was built with AI assistance. This file is the record of it. It is
graded as the finals badge, and it is worth 100 points.

Start it in week 1 and keep it up as you go. The commit history of this file is
part of the evidence: a file written all at once the night before the deadline
looks exactly like what it is.

## 1. How I used AI

At least six entries. One per real use. Every entry needs a commit link.

### 2026-09-10 - Debugged cardCarousel

- **Tool:** Github Copilot
- **What I asked for:** I asked the build AI in Visual Code to help solve my ListView as I was not yet taught of the .builder variant.
- **What it gave back:** The AI built it using ListView.builder.
- **What I kept, what I changed, and why:** I kept most of the text that are to appear when flipped, but the AI changed the format of the where each texts goes. I changed it since it was much more aligned with my wireframe.
- **Commit:** https://github.com/Angel5l/TarotAngel/commit/e914a7f29eed99733f43116875d654851079b9d5

### 2026-09-11 - Update tarotCardWidget.dart

- **Tool:** Github Copilot
- **What I asked for:** tarotCardWidget does not push to tarotDetails.dart when pressed after being flipped over.
- **What it gave back:** it made a didUpdate function to check whether the card flipped is flipped and pressed while flipped. Additionally,
a GestureDetector with a .call function is added to the Widget.
- **What I kept, what I changed, and why:** I kept the changes since it does what I asked it for, but this made it so that I cannot flip the card again to its original state, which removes the playability and fidget-like messing around with the card. It is preferable i stick to the intended action rather than an additional function.
- **Commit:** https://github.com/Angel5l/TarotAngel/commit/e914a7f29eed99733f43116875d654851079b9d5

### 2026-09-18 - ExpansionTile

- **Tool:** Github Copilot
- **What I asked for:** I was having trouble implementing on using the tarotDetails_json.dart information within the expansiontile widget in tarotDetail.dart. 
- **What it gave back:** It put the information into a variable, in which it is used as a children.
- **What I kept, what I changed, and why:** I kept the original ExpansionTile design but how the information is grabbed and used is the changes that I kept that came from AI. It was the intended result I was looking to and matches my wireframe.
- **Commit:** https://github.com/Angel5l/TarotAngel/commit/6945bf20fd8495f32a7d62108ac01c45ec6005b9#diff-e86af40571182be584f9e1a2070902e6cd80b4cbbd2329074f1c1cdf7084f64d

### 2026-09-28 - Redundancy Removal

- **Tool:** Github Copilot
- **What I asked for:** Due to the amount of trail and errors, I asked the code to clean up the pages while also retaining all of its functionality.
- **What it gave back:** It deleted some parts of the tarotCardWidget.dart.
- **What I kept, what I changed, and why:** The code mostly remained intact, it was just some of the previous attempts were retained. I kept what the AI thinks is not used. It is so that the code itself is not needlessly using space and processing power on unnecessary parts.
- **Commit:** https://github.com/Angel5l/TarotAngel/commit/42a6711cdc4ce805ab841bf3517963c871375c2b

### 2026-09-28 - Working Search Bar

- **Tool:** Github Copilot
- **What I asked for:** I do not know anything about the search bar function. So I asked for it.
- **What it gave back:** It gave back a functioning search bar that also accepts arabic numerals for finding cards that uses roman numerals.
- **What I kept, what I changed, and why:**
The search bar was empty when I made it, a lot of the code are from the AI to make the search bar happen within the short timespan.
- **Commit:** https://github.com/Angel5l/TarotAngel/commit/42a6711cdc4ce805ab841bf3517963c871375c2b

### 2026-09-28 - Image Resolution Cap

- **Tool:** Github Copilot
- **What I asked for:** To limit the resolution use of the images I created.
- **What it gave back:** it added a limit to the resolution of the images.
- **What I kept, what I changed, and why:**
The code is kept the same, only that some code was added to make sure there is a cap to how much the images take. It is to allow the app to have a better performance when testing on an actual mobile device.
- **Commit:** https://github.com/Angel5l/TarotAngel/commit/42a6711cdc4ce805ab841bf3517963c871375c2b



## 2. Where the AI got it wrong

Three cases. Be specific. If you write that the AI was never wrong, this section
scores zero.

### Case 1 - Background Image

- **What it gave me:** The background image at the background of the pages
- **What was wrong with it:**  the image was small and was placed at the right bottom rather than the middle of the screen 
- **What I did instead:** I put Center() on the code given and had to change width and height values alongside added opacity.
- **Commit:** https://github.com/Angel5l/TarotAngel/commit/42a6711cdc4ce805ab841bf3517963c871375c2b

### Case 2 - Flipping Animation

- **What it gave me:** it gave me an AnimatedBuilder in the tarotCardWidget.dart
- **What was wrong with it:**  The flipping animation does not toggle when a card is pressed in cardCarousel.dart
- **What I did instead:** I did not pursue any further as that part of the code is just not within my current goals and I have to finish the code's core features first.
- **Commit:** https://github.com/Angel5l/TarotAngel/commit/6945bf20fd8495f32a7d62108ac01c45ec6005b9#diff-92e00e8166a16dbbae7ee11347203dfe17cca13ad1e505f75400ca935d294688

### Case 3 - Theme Application

- **What it gave me:** it used the onSurface theme on the widgets in the tarotDetail.dart.
- **What was wrong with it:**  the black background of the widgets made hard to look at and is not part of the wireframe plan.
- **What I did instead:** I had to replace the onSurface to surface.
- **Commit:** https://github.com/Angel5l/TarotAngel/commit/6945bf20fd8495f32a7d62108ac01c45ec6005b9#diff-92e00e8166a16dbbae7ee11347203dfe17cca13ad1e505f75400ca935d294688

## 3. Who wrote what

At least a fifth of this project is code you wrote yourself. Name it, and explain
it in your own words.

> Group projects: give each member their own heading below, and use your GitHub
> handle as the heading. You are graded on your own section.

### Written by me

- **File:** home.dart
- **Commit:** https://github.com/Angel5l/TarotAngel/commit/e914a7f29eed99733f43116875d654851079b9d5
- **What it does and why it is built this way:**
It is a simple home screen with a search bar and a 'Start Reading' Button at the bottom of the screen where it will push the user to cardTinder.dart. Note: The AI made the search bar useable and functioning. I just built the button and page itself other than the working Search Bar.

- **File:**  cardTinder.dart
- **Commit:** https://github.com/Angel5l/TarotAngel/commit/e914a7f29eed99733f43116875d654851079b9d5
- **What it does and why it is built this way:**
It is a card swiper where the user can swipe either left to reject a card or right to accept a card. A counter is provided to show how many cards are to be read, and a 'To Reading' button that pushes to cardCarousel.dart. I used CardSwiper to build the cards and added a AllowedSwipeDirection for the left and right mechanics.

- **File:** tarotDetails_json.dart
- **Commit:** https://github.com/Angel5l/TarotAngel/commit/6945bf20fd8495f32a7d62108ac01c45ec6005b9#diff-92e00e8166a16dbbae7ee11347203dfe17cca13ad1e505f75400ca935d294688
- **What it does and why it is built this way:**
It stores the tarot's id, element, description, upright, reverse for each of the tarot cards available.
id - Number associated with the card 
element - The 4 major element that the card is from
description - Describes the card itself and its design
upright - Meaning of the card with the upright orientation
reverse - Meaning of the card with the reverse orientation

- **File:** tarot_json.dart
- **Commit:** https://github.com/Angel5l/TarotAngel/commit/e914a7f29eed99733f43116875d654851079b9d5
- **What it does and why it is built this way:**
It stores the tarot's id, name, type, description, descriptionR, imagePath, imagePathR for each of the tarot cards available.
id - Number associated with the card
name - Name of the card
type - whether it is major or minor
description - short meaning when upright
descriptionR - short meaning when reversed
imagePath - links where the image for upright is located
imagePathR - links where the image for reverse is located

### The AI-written part I understand best

- **File:** tarotDetail.dart
- **Commit:** https://github.com/Angel5l/TarotAngel/commit/6945bf20fd8495f32a7d62108ac01c45ec6005b9#diff-92e00e8166a16dbbae7ee11347203dfe17cca13ad1e505f75400ca935d294688
- **What it does and why we kept it:**
getCardDetails function maps the information within the tarotDetails_json.dart. With that it uses the id of the card used as the argument when pushed during the cardCarousel.dart page. the id is then placed into the variable selectedDetails, in which finds the information by using the ['argument'] to place at the appropriate final variable. These variables are then used as children for the widgets whenever they expand to showcase the data gotten.

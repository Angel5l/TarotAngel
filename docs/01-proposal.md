# Proposal

Paste in the proposal you submitted, and replace it with the final version when
the project is done. You do not need to keep it in sync week to week: nobody
reads this folder until you hand the project in.

Keep these headings so a reader can scan it:

## The problem, in one sentence

People or myself personally require tarot reading, and I do not have a deck in hand.

## Who it is for

It is for people who do not have a deck at hand. Usually, some people google and have to use 
data or have access to the internet so that they can search for a tarot reading website.

## Core features

Tarot Reading - Users get to have their cards read to them 
Card Swipe - Allows users to select which card will they pick before being revealed.
Summary - A list that has all the cards they have gotten
Search Bar - Allows users to search for the card's details when forgetten.

## Out of scope, and why

Flip Animation - Time constraints dissuaded me from pursuing and improving on this design.
All 78 Cards - I will be adding more in the future, but as of right now, due to the shortage of time, I will be delaying the implementation of all the cards.

## Data the app remembers, and where it is saved

tarot_json.dart - id, name, type, description, descriptionR, imagePath, imagePathR - Local
tarotDetails.dart - id, element, description, upright, reversed - Local

## Risks

The risk from before still applies. I am still worrisome with the build of the project, yet the m4 
and m5 activities did improve some of my shortcomings. Additionally, new problems arise due 
to the added requirements of storing data. Further readings and learnings are essential for these 
requirements to be met. 

## Changes since the last version

The core features had some readjustments as expectations shifted. Search and Summary proved 
to be much more of a hurdle than planned. On the other hand, the Reversed/Upright orientation 
of the card was easily implemented while creating their details.

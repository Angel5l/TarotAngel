# Demo video

**File:** ['demo.mp4'](https://github.com/Angel5l/TarotAngel/blob/main/docs/assets/demo.mp4)
**Length:** aim for 3 to 5 minutes
**Recorded on:** Desktop & Phone

## What it shows

A short list, in order, so a viewer can skip to what they need:

- 0:00 what the app is and who it is for
- 0:14 home.dart and Search Bar
- 0:22 tarotDetail.dart Page
- 0:47 cardTinder.dart / Swiper Page
- 1:05 cardCarousel.dart or Summary Page
- 2:10 Favorite Feature

## Getting it into the repo

GitHub **blocks any file over 100 MB** and warns over 50 MB, so compress before
you commit:

```bash
ffmpeg -i raw.mp4 -vcodec libx264 -crf 28 -preset slow \
       -vf scale=-2:720 -acodec aac -b:a 96k demo.mp4
```

Raise `-crf` (28 to 32) or drop to `-2:480` if it is still too large. If it still
does not fit, attach it to a **GitHub Release** or upload it unlisted and link it
here. Never commit the raw capture: git keeps it forever even after you delete
it.

## Before you record

- Real data off the screen: no classmates' names, numbers, faces or messages.
- Notifications off.
- Sensible sample data, not "asdf".
- One unbroken take per feature. Say what you are doing while you do it.

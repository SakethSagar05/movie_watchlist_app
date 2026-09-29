# Setup (about 10 minutes)

1. Create the project and make the first commit:
   ```
   flutter create movie_watchlist_app
   cd movie_watchlist_app
   git init
   git remote add origin YOUR_GITHUB_URL
   git add . && git commit -m "chore: init Flutter project"
   git push -u origin main
   ```
2. Copy `lib/`, `assets/` and `test/` from this folder into the project (overwrite `lib/main.dart` and `test/widget_test.dart`).
3. Open `pubspec.yaml` and, under the existing `flutter:` section, add (2-space indent, no tabs):
   ```
   flutter:
     uses-material-design: true
     assets:
       - assets/images/
   ```
4. Run `flutter pub get`, then run the app and do a hot **restart**.
5. Optional: replace the placeholder posters in `assets/images/` with real ones using the same filenames.
6. Build: `flutter build apk --release`
   APK: `build/app/outputs/flutter-apk/app-release.apk`

## Commit as you go (graders read your history)
Copy files in stages and commit after each one, for example:
- `feat: add Movie model and sample movie data`
- `feat: build HomeScreen with ListView.builder`
- `chore: add poster assets and declare them in pubspec.yaml`
- `feat: add DetailsScreen and pass Movie via Navigator.push`
- `feat: add watchlist toggle and WatchlistScreen`
- `style: polish theme, cards and Hero transitions`
- `build: release APK`

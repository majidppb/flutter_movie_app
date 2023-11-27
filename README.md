
# Movie App
##  Used
- [TMDB] API for the movie data.
- Bloc : For effective state mangement.
- Go Router : For routing.
- SQFlite : For local database.
- Infinite Scroll Pagination
- Cached Network Image
- Dependency Injection

## Features
- **Login**: shared preferences are utilized to effectively manage and store login details, including the login status.
*NOTE: The app uses dummy password checking; it permits the users to log in if the values entered for username and password are exactly the same (e.g., username: abc, password:abc).*
- **Multiple Profiles**: It enables multiple profiles within an account, allowing users to add and choose profiles after logging in.
- **Search**: Incorporated Pagination for searching movies, enhancing the user experience.
- **Movie Details**: Created a movie details screen and enabled the addition of movies to a personalized '**My List**', with separate lists stored in a local database for each user profile.
- **Share**: Implemented the feature to share movies (text) with a direct link that opens in the app.
- **Deep linking**: The app can be directly launched to a screen through a clickable link, utilizing  `movieapp.com` as the link.
*NOTE: The domain is used for study purposes and doesn't imply ownership*.
## Run the project

- Clone the repository
- Get a [TMDB] API token (easy step; there are a lot of tutorials helping with it).
- Place the API Token in `/lib/infrastructure/api_key.dart` as
`const  accessToken  = 'your_token';`
-  Run

       cd movie_app
        flutter pub get
        flutter run

 *NOTE : The application was run on Android while in development and was not tested on iOS.*
  
[TMDB]: <https://developer.themoviedb.org/reference/intro/getting-started>
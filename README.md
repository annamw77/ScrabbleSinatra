# Scrabble Sinatra
Let's leverage what we've learned about Sinatra and our earlier Scrabble project to build an online Scrabble scoring site.

## Baseline Setup
This is an individual project (but yinz should still help each other because <3).

- You'll need your Scrabble code from a couple of weeks ago.
- Fork this repo to your Github account, then clone it into your `projects` directory.
- Spend a half hour or so with your Scrabble code refamiliarizing yourself with how it works.

## Baseline
**As always, work together to accomplish this baseline.**

This project...

- needs a Gemfile so others are aware of its dependencies
- needs a `config.ru` file so that the webserver can be started with `$ rackup`.
- should include `Sinatra::Reloader` so development is less cumbersome.

To get started...

- Create a new Sinatra application with a home page (root route for `/`) that contains a link
  - This link will navigate to a score page, including route & view, at `/score`
  - The score page by default should say "coming soon!" or something along those lines

## Primary requirements
All of these requirements should use your Scrabble project code to score words and lists of words.

- All Pages:
  - Focus on creating semantic HTML structures
  - Include CSS to add distinction, style, and character to your site
- Score page:
  - Accessible from `/score`
  - Includes a form that contains one text input
  - On form submission, your app will `POST` the user input
  - Once user input is retrieved, your app will score the input and then display the calculated score in the rendered view
- Score many words page:
  - Accessible from `/score-many`
  - Allow the user to score multiple words with a single form
  - Determine how to allow the user to input multiple words
    - What input types would best allow users to enter a variable number of words?
    - What instruction/guidance can you offer the user to make your interface understandable?
  - Display each word and its score in the rendered view.

## Optional Enhancements
- In any view that shows a scored word, include a letter-by-letter breakdown showing the point value for each letter along with the score for the word. Avoid duplicating markup wherever possible; use _partials_ to DRY up erb logic and HTML blocks.
- Modify the `/score-many` form to include radio buttons that will change the way the words are scored. The user can choose which piece of information has the highest weight. Either:
  - 7-letters highest (the default from the original project)
  - Shortest word always (will outweigh 7-letters)
- Implement a GET route that provides equivalent functionality as found on `/score`, i.e., allows a user to score a single word on demand.
  - Hint: Think about idempotency; how could scoring be implemented in a way that is idempotent?

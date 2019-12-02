# Google Lucky
A server to return a redirect to the top Google Search result using the Google Custom Search Engine API, mimicing "I'm Feeling Lucky!" functionality (without having to be on the Google homepage)

As the [Google CSE API](https://developers.google.com/custom-search/v1/overview#pricing) only offers 100 searches per day for free, this server can only reasonably be individually hosted and used.

## Setup
1. Make a [Google Custom Search Engine](https://cse.google.com). It will ask for at least one website; enter any, we will remove it later.
2. In the CSE settings:
    - Remove the website you added previously
    - Turn on the "Search the entire web" option
    - Note the `Search engine ID`, which will be necessary for configuration
3. Get an [API key](https://developers.google.com/custom-search/v1/introduction) for your Custom Search Engine.
4. [Deploy](https://hexdocs.pm/phoenix/deployment.html). This step is left as an exercise to the reader. See `config/prod.secret.exs` for necessary environment variables.

    If deploying on a free Heroku instance (which requires credit card information to have enough free dyno hours for 24/7 monthly uptime), set the `GOOGLE_HEROKU_NAME` variable to the name of your heroku app for the server to ping itself to stay awake.

## Use
- **Chrome:**
  - in `chrome://settings/searchEngines` add `[url]/q=%s`
- **Firefox:**
  1. create a [`manifest.json`](https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Your_first_WebExtension) with [`"chrome_settings_overrides"`](https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/manifest.json/chrome_settings_overrides), `"search_url": "https://[url]/?q={searchTerms}"`
  2. [add an ID and get the add-on signed](https://extensionworkshop.com/documentation/publish/distribute-sideloading/); follow the instructions to sideload the search engine add-on

## Why?
Sometimes, we know the exact webpage we want to navigate to, but either we don't know the URL, or it's too tedious to type in the URL manually.

A common, easier way to naviate to these pages is via a Google search in the address bar. So frequently do many of us make these searches for known web pages that our queries almost always result in our desired destination being the top Google Search result. Then, because our desired result is the top result, it seems possible to remove the necessity of having to click that first result, and just have our address bar query redirect us automatically.

Previously, this was possible by setting the url of an "I'm Feeling Lucky" Google search as a browser search engine: `https://google.com/search?btnI=I&q={searchQuery}`

However, around October 2019, the above link was changed to require a token (which would be available when making a "I'm Feeling Lucky" search naturally from the Google homepage), and would lead to a intermediate redirect confirmation page without.

One solution is to switch to DuckDuckGo: `http://duckduckgo.com/?q=\{searchQuery}`

However, I've found that DuckDuckGo would occasionally, much more frequently than Google, not return what I would consider the subjectively best result that my queries should map to.

Thus, to retain the quality of Google searches, here we are with a duct tape redirect to the top Google search result.
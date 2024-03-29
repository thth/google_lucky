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
4. [Deploy](https://hexdocs.pm/phoenix/deployment.html). This step is left as an exercise to the reader. See `config/runtime.exs` for necessary environment variables.

## Use
- **Chrome:**
  - in `chrome://settings/searchEngines` add `[url]/q=%s`
- **Firefox:**
  - add `[url]/q=%s` as a [bookmark with a keyword](https://superuser.com/a/7374)

## Why?
Google is very good at _navigational_ searches — searches where you know what the top result should be. Navigating to these web pages can often be most convenient via Google, and can be even more convenient without having to visit the search page just to click the first result.

Previously, this was possible by setting the url of an "I'm Feeling Lucky" Google search as a browser search engine: `https://google.com/search?btnI=I&q={searchQuery}`, but around October 2019 the above link was changed to require a token (which would be available when making a "I'm Feeling Lucky" search naturally from the Google homepage), and would lead to a intermediate redirect confirmation page without.
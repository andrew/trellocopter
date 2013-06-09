# Trellocopter

Schedule commands for your AR Drone to perform commands from a Trello Board

## Setup

* Create a board on trello: https://trello.com/
* Generate app key: https://trello.com/1/appKey/generate
* Create an access token: https://trello.com/docs/gettingstarted/index.html#getting-a-token-from-a-user
* Create cards with javascript commands in the name of the card, example: https://trello.com/board/drone-commands/518e25cbba8d6dbd35000785

```
git clone git@github.com:andrew/trellocopter.git
cd trellocopter
KEY=your-key TOKEN=your-token BOARD=your-board-id node index.coffee
```

### Note on Patches/Pull Requests

 * Fork the project.
 * Make your feature addition or bug fix.
 * Add documentation if necessary.
 * Add tests for it. This is important so I don't break it in a future version unintentionally.
 * Send a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2013 Andrew Nesbitt. See [LICENSE](https://github.com/andrew/trellocopter/blob/master/LICENSE) for details.

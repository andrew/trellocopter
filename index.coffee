Trello = require("node-trello")
async = require('async')
arDrone = require('ar-drone')

t = new Trello(key, token)
drone = arDrone.createClient()

key = process.env['KEY']
token = process.env['TOKEN']
board = process.env['BOARD']

delay = (ms, func) -> setTimeout func, ms

todo = undefined
doing = undefined
done = undefined

loadLists = (board, cb) ->
  t.get "/1/boards/" + board + "/lists", (err, data) ->
    throw err  if err
    todo = data[0]
    doing = data[1]
    done = data[2]
    cb()

moveCard = (card, list, cb) ->
  t.put "/1/cards/" + card.id + "/idList?value=" + list.id, cb

performCard = (card, cb) ->
  moveCard card, doing, (err, data) ->
    throw err  if err
    console.log(card.name)
    eval(card.name)
    delay 1000, ->
      moveCard card, done, (err, data) ->
        throw err  if err
        cb(err, data)

loadLists board, ->
  t.get "/1/lists/" + todo["id"] + "/cards/open", (err, cards) ->
    throw err  if err
    async.eachSeries cards, performCard, (err)->
      console.log('done!')
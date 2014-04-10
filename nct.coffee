# Description:
#   Treat you a song from nhaccuatui.com
#
# Commands:
#   hubot nct|nhaccuatui|nhaccuatao <query>
module.exports = (robot) ->
  robot.respond /(nct|nhaccuatui|nhaccuatao) (.*)/i, (msg) ->
    query = msg.match[2]
    robot.http("http://ajax.googleapis.com/ajax/services/search/web?v=1.0&q=Luca")
      .query({
        v: '1.0',
        q: query+' site:nhaccuatui.com'
      })
      .get() (err, res, body) ->
        body = JSON.parse(body)
        results = body.responseData.results

        unless results.length > 0
          msg.send "No song for \"#{query}\""
          return

        results.forEach (link) ->
          if link.url.match /bai-hat/i
            msg.send link.url
            # Just send one link
            return         


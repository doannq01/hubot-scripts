# Description:
#   Treat you a song from nhaccuatui.com
#
# Commands:
#   hubot nct|nhaccuatui|nhaccuatao <query>
module.exports = (robot) ->
  robot.respond /(nct|nhaccuatui|nhaccuatao) (.*)/i, (msg) ->
    query = msg.match[2]
    robot.http("http://ajax.googleapis.com/ajax/services/search/web")
      .query({
        v: '1.0',
        q: query+' site:nhaccuatui.com'
      })
      .get() (err, res, body) ->
        body = JSON.parse(body)
        results = body.responseData.results

        unless results.length > 0
          msg.send 'Làm khó nhau quá, không tìm thấy **'+query+'**'
          return

        content = ''
        results.forEach (link) ->
          if link.url.match /\/bai-hat\//i
            content = link.url

        # Just send one link
        msg.send content


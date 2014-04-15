# Description:
#   Look up a word in tratu.vn
#
# Commands:
#   hubot tratu <word>
S = require 'string'

module.exports = (robot) ->
  robot.respond /(tratu) (.*)/i, (msg) ->
    query = msg.match[2]
    robot.http("http://tratu.soha.vn/dispatchaddon.php")
      .query({
        _: +(new Date),
        dict: 'en_vn',
        title: query,
        type: 'json'
      })
      .get() (err, res, body) ->
        body = eval body
        data = body.data

        unless data.length > 0
          msg.send 'Không tìm thấy **'+query+'**'
          return

        content = S(data[0]).stripTags().trim().s

        msg.send content if content != ''
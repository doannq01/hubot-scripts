# Description:
#   Let the bitch cheer you up
#
# Commands:
#   hubot tuyet bich|tuyet bich

randomDate = (start, end) ->
    return new Date start.getTime() + Math.random() * (end.getTime() - start.getTime())

module.exports = (robot) ->
  robot.respond /(tuyet bitch|tuyet bich|bich|bitchy|bichy)/i, (msg) ->
    query = msg.match[2]

    time = randomDate new Date(2013, 8, 1), new Date

    robot.http('https://graph.facebook.com/333808953418723/photos')
      .query({
        limit: 1,
        fields: 'images.fields(source,width)',
        until: Math.floor +time / 1000 # Miliseconds
      })
      .get() (err, res, body) ->
        body = JSON.parse(body)

        if body.data.length < 0
          msg.send 'Chụy đang bận, không tìm thấy hình cho cưng được, thử lại đi nhoa'
          return

        content = ''
        body.data[0].images.forEach (image) ->
          content = image.source if image.width > 600 and image.width < 1000
        
        content = 'Cưng thử lại giùm chị cái, có gì đó không ổn đã xảy ra' if content is ''
        msg.send content

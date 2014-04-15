# Description:
#   Return some funny saying when calling the bot
#
# Commands:
#   hubot 
randomInt = (low, high) ->
  return Math.floor Math.random() * (high - low + 1) + low

module.exports = (robot) ->
  robot.respond /(oi|ơi|à|hỡi|hoi|nói nghe nè)(.*)$/i, (msg) ->
    msgs = [
      'Dạ?',
      'Dạ mẹ?',
      'Thôi thế từ đây anh cố đành quên rằng có người...',
      'Mình yêu nhau đi',
      'http://youtu.be/funAgxkPXRg?t=24s',
      'Vâng có em',
      'Sao đó thím?',
      'Ai kêu tui đó, có tui đây',
      'Gì hả má nội?',
      'Chờ tí đang bận. Rồi giờ muốn gì?',
      'Rảnh quá hay sao mà kêu tui vậy má?'
    ]

    idx = randomInt 0, msgs.length
    msg.send msgs[idx]


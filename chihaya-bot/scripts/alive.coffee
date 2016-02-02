module.exports = (robot) ->
  robot.hear /airvideo/, (msg) ->
    
    @exec = require('child_process').exec
    command = "php /home/mitsugogo/slack/haruka-bot/scripts/shells/airvideo.php"
    @exec command, (error, stdout, stderr) ->
      msg.send "プロデューサーさん！障害ですよ！障害！ [Airvideo is Down!]" if error?
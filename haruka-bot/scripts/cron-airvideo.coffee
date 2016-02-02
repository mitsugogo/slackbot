cronJob = require('cron').CronJob

module.exports = (msg) ->
   cronjob = new cronJob('0 3 * * * *', () =>
       @exec = require('child_process').exec
       command = "php /home/mitsugogo/slack/haruka-bot/scripts/shells/airvideo.php"
       @exec command, (error, stdout, stderr) ->
          envelope = room: "#faultinfo"
          msg.send envelope, "Airvideo Serverのダウンを検知しました" if error?
   )
   cronjob.start()

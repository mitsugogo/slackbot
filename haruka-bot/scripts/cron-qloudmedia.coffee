cronJob = require('cron').CronJob

module.exports = (msg) ->
   cronjob = new cronJob('0 2 * * * *', () =>
       @exec = require('child_process').exec
       command = "php /home/mitsugogo/slack/haruka-bot/scripts/shells/qloudmedia.php"
       @exec command, (error, stdout, stderr) ->
          envelope = room: "#faultinfo"
          msg.send envelope, "Qloud Mediaのダウンを検知しました" if error?
   )
   cronjob.start()

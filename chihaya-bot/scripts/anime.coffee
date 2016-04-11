module.exports = (robot) ->
  robot.respond /anime me/, (msg) ->
    @exec = require('child_process').exec
    command = "ruby /home/mitsugogo/slack/chihaya-bot/original/anime.rb"
    @exec command, (error, stdout, stderr) ->
      msg.send error if error?
      msg.send stdout if stdout?
      msg.send stderr if stderr?

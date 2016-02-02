module.exports = (robot) ->

 

  robot.enter (res) ->
     unless /general/.test res.envelope.room
         res.finish()
         
     if /bot/.test res.envelope.user.name
         res.finish()
         
     res.reply "いらっしゃい。gogoserver.slack.com よ。iOS、Android、Windows向けにネイティブアプリがあるらしいからダウンロードするといいらしいわ。\n" + "https://slack.com/downloads"

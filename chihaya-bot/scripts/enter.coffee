module.exports = (robot) ->

 

  robot.enter (res) ->
     unless /general/.test res.envelope.room
         res.finish()
         
     if /bot/.test res.envelope.user.name
         res.finish()
         
#     res.reply "gogoserver.slack.com へようこそ。iOS、Android、Mac向けにネイティブアプリがあるからダウンロードするといいらしいわ。\n" + "https://slack.com/downloads"

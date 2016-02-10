module.exports = (robot) ->

  robot.hear /千早/i, (res) ->
     res.reply "何？でホルス"

  randomGreeting = ['えっ…いつも何を聞いているか、ですか？気になりますか？なら…聞いてみますか？…どうぞ'
                  , '歌を歌えるならば、肩書きはアイドルでも何でも構いません。厳しい指導をお願いします'
                  , '春香…'
                  , '高槻さんかわいい'
                  , 'あの…私にとって、歌は私の全てですから…。どんなに厳しい指導でも、きっと乗り越えてみせます'
                  , 'お疲れ様です、プロデューサー'
                  , '私の調子は悪くないかと']

  robot.respond /(元気？|何かしゃべって)/i, (res) ->
     res.reply res.random randomGreeting
    
  
  robot.respond /(乳|チチ|胸|ムネ|おっぱい|ぱいおつ|パイオツ|カップ)/i, (res) ->
     res.reply "えっ…なんのこと？"
  
  

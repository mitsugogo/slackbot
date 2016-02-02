module.exports = (robot) ->

  robot.hear /^72$/i, (res) ->
     res.send "くっ…"

  robot.hear /(やよい|うっうー)/i, (res) ->
     res.send "高槻さんかわいい…"

  robot.hear /れべおめ/i, (res) ->
    res.send "@sysecond--"
    
  robot.hear /remove sysecond/i, (res) ->
    res.send "@sysecond--"
    
  robot.hear /ぐああ/i, (res) ->
    res.send "にゃぶい"
    
  robot.hear /ごちうさ/i, (res) ->
    res.send "あぁ^～心がぴょんぴょんするんじゃぁ^～"

  robot.hear /google(:|：)( |　)(.*)/i, (res) ->
     name = encodeURIComponent(res.match[3])
     res.send "https://www.google.co.jp/webhp?hl=ja#hl=ja&q=#{name}"
     
  robot.hear /yahoo(:|：)( |　)(.*)/i, (res) ->
     name = encodeURIComponent(res.match[3])
     res.send "http://search.yahoo.co.jp/search?p=#{name}"
     
  robot.hear /twitter(:|：)( |　)(.*)/i, (res) ->
     name = (res.match[3])
     res.send "https://twitter.com/search?q=#{name}&src=typd"
     

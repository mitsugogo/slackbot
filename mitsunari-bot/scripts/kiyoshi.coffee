# Description:
#   ズンズンズンズンドコキ・ヨ・シ！
#

module.exports = (robot) ->

   # redisに保存するためのキー
   KEY_KIYOSHI_ZUN1 = 'kiyoshi_zun1'
   KEY_KIYOSHI_ZUN2 = 'kiyoshi_zun2'
   KEY_KIYOSHI_ZUN3 = 'kiyoshi_zun3'
   KEY_KIYOSHI_ZUN4 = 'kiyoshi_zun4'

   # 書き込みを4つ前まで記録
   robot.hear /(.*)/, (msg) ->
       message  = msg.match[1]
       zun1    = (robot.brain.get KEY_KIYOSHI_ZUN1) or ''
       zun2    = (robot.brain.get KEY_KIYOSHI_ZUN2) or ''
       zun3    = (robot.brain.get KEY_KIYOSHI_ZUN3) or ''
       zun4    = (robot.brain.get KEY_KIYOSHI_ZUN4) or ''
   
       robot.brain.set KEY_KIYOSHI_ZUN1, zun2
       robot.brain.set KEY_KIYOSHI_ZUN2, zun3
       robot.brain.set KEY_KIYOSHI_ZUN3, zun4
       robot.brain.set KEY_KIYOSHI_ZUN4, message
   
       if zun3 is "ズン" && zun4 is "ズンズン" && message is "ズンドコ"
           msg.send "キ・ヨ・シ！"
       else if zun2 is "ズン" && zun3 is "ズン" && zun4 is "ズン" && message is "ズンドコ"
           msg.send "キ・ヨ・シ！"  


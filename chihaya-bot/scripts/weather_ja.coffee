request = require 'request'

module.exports = (robot) ->

  robot.respond /(今日の天気).*/i, (msg) ->
    request 'http://weather.livedoor.com/forecast/webservice/json/v1?city=230010', (error, res, body) ->
      json = JSON.parse body
      todayWeather = json['forecasts'][0]
      maxTemp = if `todayWeather['temperature']['max'] == null` then '-' else todayWeather['temperature']['max']['celsius']
      msg.reply todayWeather['dateLabel'] + 'の天気は' + todayWeather['telop'] + 'です\n' + '最高気温は' + maxTemp + "℃です\n" + json['description']['text'] + "\n"

  robot.respond /(明日の天気).*/i, (msg) ->
    request 'http://weather.livedoor.com/forecast/webservice/json/v1?city=230010', (error, res, body) ->
      json = JSON.parse body
      todayWeather = json['forecasts'][1]
      minTemp = if `todayWeather['temperature']['min'] == null` then '-' else todayWeather['temperature']['min']['celsius']
      maxTemp = if `todayWeather['temperature']['max'] == null` then '-' else todayWeather['temperature']['max']['celsius']
      msg.reply todayWeather['dateLabel'] + 'の天気は' + todayWeather['telop'] + 'です\n' + '最高気温は' + maxTemp + "℃、" + '最低気温は' + minTemp + "℃です\n"

  robot.respond /(明後日|あさって)の天気.*/i, (msg) ->
    request 'http://weather.livedoor.com/forecast/webservice/json/v1?city=230010', (error, res, body) ->
      json = JSON.parse body
      todayWeather = json['forecasts'][2]
      msg.reply todayWeather['dateLabel'] + 'の天気は' + todayWeather['telop'] + 'です\n'


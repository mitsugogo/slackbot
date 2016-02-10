var cronJob = require('cron').CronJob;

module.exports = function(robot) {  
  return new cronJob('10 10 10 * * *', (function(_this) {

    return function() {
      robot.http("https://ajax.googleapis.com/ajax/services/search/news?v=1.0&rsz=3&topic=h&ned=jp")
        .get()(function(err, res, body) {
          var response;
          try {
            response = JSON.parse(body);
          } catch (_error) {
            err = _error;
            err = "Sorry, but I could not fetch the latest headlines.";
          }

          if (err) {
            return err;
          }

          strings = [];
          strings.push("Here's the latest news headlines:\n");
          var _ref = response.responseData.results;

          for (var _i = 0, _len = _ref.length; _i < _len; _i++) {
            var story = _ref[_i];
            strings.push(story.titleNoFormatting.replace(/&#39;/g, "'").replace(/`/g, "'").replace(/&quot;/g, "\""));
            strings.push(story.unescapedUrl + "\n");
          }

          return robot.send({room: "#news"}, strings.join("\n"));
        });
    };
  })(this), null, true, "Asia/Tokyo");
};


var express = require('express');
var router = express.Router();
var twilio = require('twilio');
var AccessToken = twilio.jwt.AccessToken;
var VideoGrant = AccessToken.VideoGrant;

var accountSid = process.env.accountSID;
var apiSid = process.env.apiSID;
var apiSecret = process.env.apiSECRET;

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/token', function(req, res, next) {
  var accessToken = new AccessToken(
      accountSid,
      apiSid,
      apiSecret
  );

  accessToken.identity = (req.query['identity'] === undefined) ? 'Unidentified User' : req.query['identity'];

  var videoGrant = new VideoGrant();
  accessToken.addGrant(videoGrant);

  var jwt = accessToken.toJwt();

  res.send(jwt);
})

module.exports = router;

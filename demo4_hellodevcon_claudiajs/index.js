const Util = require('util');

exports.handler = (event, context, callback) => {
  console.log('Event is:', Util.inspect(event));

  callback(null, { body: JSON.stringify({ msg: "Hello Devcon" }) });
};
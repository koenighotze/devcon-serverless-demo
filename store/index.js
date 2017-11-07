console.log("Expensive cold start section");
const Util = require('util');

exports.handler = (event, context, callback) => {
  // console.log("In the handler");
  console.log("Event is:", Util.inspect(event));
  // console.log("Context is:", Util.inspect(context));

  console.log('What is global.foo?', global.foo);
  console.log("IN THE HANDLER at ", new Date());
  global.foo = "Teh fuck";
  callback(null, { body: JSON.stringify({ msg: "Hello Devcon" }) });
};
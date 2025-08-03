function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  
  if (!env) {
    env = 'staging';
  }
  var config = {
    env: env,
    baseAppUrl: 'https://reqres.in',
    timeout: 30000,
    retryCount: 3,
    retryInterval: 1000,
    newAPI_URL: 'https://automationexercise.com/api/searchProduct',
  };
  
  if (env == 'dev') {
    config.baseUrl = 'https://reqres.in';
    config.demo1 = 'this is dev env';
      config.db = {
        url: 'jdbc:h2:file:~/test;AUTO_SERVER=TRUE',
        user: 'sa',
        password: ''
      };
  } else if (env == 'staging') {
    config.baseUrl = 'https://reqres.in';
    config.demo1 = 'this is stagging env';
  config.db = {
    url: 'jdbc:h2:file:~/test;AUTO_SERVER=TRUE',
    user: 'sa',
    password: ''
  };
  }
  // Configure timeouts and retries
  karate.configure('connectTimeout', config.timeout);
  karate.configure('readTimeout', config.timeout);
  karate.configure('retry', { count: config.retryCount, interval: config.retryInterval });
  karate.log('karate config:', config);
  return config;
}
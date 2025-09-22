function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);

  if (!env) {
    env = 'testing';
  }
  var config = {
    env: env,
    baseAppUrl: 'https://reqres.in',
    shoppingCartAPI : 'https://automationexercise.com/api',
    timeout: 30000,
    retryCount: 3,
    retryInterval: 1000,
    newAPI_URL: 'https://automationexercise.com/api/searchProduct',
        baseUrl: 'http://localhost:8080',
        dbUrl: 'jdbc:h2:~/test',
        dbUser: 'sa',
        dbPassword: '',

        DbUtils: Java.type('utils.DbUtils'),
        DbQueries: Java.type('utils.DbQueries'),
         headers: {
              'x-api-key': 'reqres-free-v1',
              'Content-Type': 'application/json'
            },
         variable1: "varible1 value",
         flag1: true
  };

  if (env == 'dev') {
    config.baseUrl = 'https://reqres.in';
    config.demo1 = 'this is dev env';
      config.db = {
        url: 'jdbc:h2:file:~/test;AUTO_SERVER=TRUE',
        user: 'sa',
        password: ''
      };
  } else if (env == 'testing') {
    config.baseUrl = 'https://reqres.in';
    config.demo1 = 'this is testing env';
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
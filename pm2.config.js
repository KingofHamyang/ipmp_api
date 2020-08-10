module.exports = {
  apps : [{
    name        : "ipmp-rails",
    args        : [
      "server",
      "--binding",
      "0.0.0.0"
    ],
    script      : "~/.rvm/gems/ruby-2.6.1/bin/rails",
    watch       : true,
    env: {
      "RAILS_ENV": "development",
    },
    env_production : {
       "RAILS_ENV": "production"
    }
  }]
}
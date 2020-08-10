module.exports = {
  apps : [{
    name        : "ipmp-rails",
    script      : "bundle exec & rails s --binding 0.0.0.0",
    watch       : true,
    env: {
      "RAILS_ENV": "development",
    },
    env_production : {
       "RAILS_ENV": "production"
    }
  }]
}
#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

// Use Handlebars/Moustache style templates to prevent conflict with ERB.
_.templateSettings = {
  interpolate: /\{\{(.+?)\}\}/g
};

window.TwitterApp = {
  Models: {},
  Collections: {},
  Routers: {},
  Views: {}
  };

 $(document).ready(function () {
  TwitterApp.tweetsPosts = new TwitterApp.Collections.Tweets();
  TwitterApp.tweetsPosts.fetch().done(function () {
  	console.log("hello")
    TwitterApp.router = new TwitterApp.Routers.appRouter();
    Backbone.history.start({pushState: false}); // Modernizr.history});
  });
});
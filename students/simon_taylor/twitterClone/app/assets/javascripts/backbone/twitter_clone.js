//= require_self
//= require_tree ./templates
//= require_tree ./models
//= require_tree ./views
//= require_tree ./collections
//= require_tree ./routers

window.TwitterClone = {
  //to store various backbone classes
  Models: {},
  Collections: {},
  Routers: {},
  Views: {}
};

//setup underscore templating to expect {{ x }}
_.templateSettings = {
  interpolate: /\{\{(.+?)\}\}/g
};

$(document).ready(function () {
  //create a new posts collection
  TwitterClone.posts = new TwitterClone.Collections.Posts();
  //fetch the posts from the server to populate the collection
  TwitterClone.posts.fetch().done(function () {
    //instansiate the router
    TwitterClone.router = new TwitterClone.Routers.appRouter;
    //start the backbone router
    Backbone.history.start();
  });
});

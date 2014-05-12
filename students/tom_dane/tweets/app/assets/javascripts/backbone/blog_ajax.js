//= require_self
//= require_tree ./templates
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views
//= require_tree ./routers

// Use Handlebars/Moustache style templates to prevent conflict with ERB.
_.templateSettings = {
  interpolate: /\{\{(.+?)\}\}/g
};

// Define our global object.
window.BlogAjax = {
  Models: {},
  Collections: {},
  Routers: {},
  Views: {}
};

// Instantiate and kick off router ONCE the blog posts have been fetched.
$(document).ready(function () {
  BlogAjax.blogPosts = new BlogAjax.Collections.Posts();
  BlogAjax.comments = new BlogAjax.Collections.Comments();
  // BlogAjax.comments.fetch();
  BlogAjax.blogPosts.fetch().done(function () {
  BlogAjax.router = new BlogAjax.Routers.appRouter();
  Backbone.history.start({pushState: false}); // Modernizr.history});
  });
});

#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

// Use handlebars/Moustache style templates to prevent conflict with ERB
_.templateSettings = {
  interpolate: /\{\{(.+?)\}\}/g
};

//Define our global object
window.TwitterAjax = {
  Models: {},
  Collections: {},
  Routers: {},
  Views: {}
};

$(document).ready(function () {
	TwitterAjax.blogPosts = new TwitterAjax.Collections.Posts();
	TwitterAjax.blogPosts.fetch().done(function () {
		TwitterAjax.router = new TwitterAjax.Routers.appRouter();
		Backbone.history.start({pushState: false}); //Modernizr.history});	
	});
});
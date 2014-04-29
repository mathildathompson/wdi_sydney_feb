TwitterAjax.Collections.Posts = Backbone.Collection.extend({
	url: '/posts',
	model: TwitterAjax.Models.Post
});
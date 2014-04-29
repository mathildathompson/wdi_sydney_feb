TwitterAjax.Models.Post = Backbone.Model.extend({
	urlRoot: '/posts',
	defaults: {
		title: 'New Post Title',
		slug: 'new-post',
		content: 'New post content'
	}
});
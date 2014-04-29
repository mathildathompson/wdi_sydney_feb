TwitterAjax.Routers.appRouter = Backbone.Router.extend({
	routes: {
		'': 'index',
		'posts/:id': 'showPost',
		'*anything': 'goHome'
	},

	index: function () {
		var view = new TwitterAjax.Views.AppView({collection: TwitterAjax.blogPosts});
		view.render();
	},

	showPost: function (id) {
		var post = TwitterAjax.blogPosts.get(id);
		new TwitterAjax.Views.PostView({model: post});
	},

	goHome: function () {
		document.location.hash = '';
	}
});
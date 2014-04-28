TwitterApp.Routers.appRouter = Backbone.Router.extend({
	routes:{
		'': 'index',
		'tweets/:id': 'showTweet',
		'*anything': 'goHome'
	},

	index: function(){
		var view = new TwitterApp.Views.AppView({collection: TwitterApp.tweetsPosts});
		view.render();
	},

	showTweet: function(){
		var tweet = TwitterApp.tweetsPosts.get(id);
		new TwitterApp.Views.TweetView({model: tweet});
		console.log("Hello")
	},

	goHome: function(){
		document.location.hash= '';
	}
});
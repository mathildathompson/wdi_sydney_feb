TwitterApp.Views.TweetListView = Backbone.View.extend({
	tagName: 'li',


	initialize: function(){
		this.template = _.template($('#tweetListView').html());
		this.render();

		this.newtweets = new TwitterApp.Collections.Tweets({content: this.model.get('content')});

		this.newtweets.fetch().done(function(){
			this.newtweets.each(function(tweet, index){
				var tweetView = new TwitterApp.Views.AppView({model: tweet});
				newTweetView.render();
			});
		});
	},

	render: function(){
		this.$el.html(this.template(this.model.toJSON()));
		return this;
	},

	viewTweet: function(event){
		event.preventDefault();
		TwitterApp.router.navigate('tweets/' + this.model.get('id'), true);
	}
});
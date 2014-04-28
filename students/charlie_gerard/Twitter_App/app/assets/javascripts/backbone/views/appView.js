TwitterApp.Views.AppView = Backbone.View.extend({
	el: '#main',

	events:{
		'submit': 'addTweet'
	},

	addTweet: function(event){
		console.log("Tweet")
		event.preventDefault();
		var content = $('#newtweet').val();

		var newtweet = new TwitterApp.Models.Tweet({
			content: content
		}) ;
		debugger;

		newtweet.save();

		var newtweetView = new TwitterApp.Views.TweetView({model: tweet})
		newtweetView.render();
		console.log("Hello there")
	},

	initialize: function(){
		this.template = _.template($('#appView').html());
		this.render();
	},

	render: function(){
		this.$el.html(this.template());

		 this.collection.each(function(tweet){
		 	var view = new TwitterApp.Views.TweetListView({model:tweet});
		 	$('#tweets').append(view.render().el);
		 });
	}
});
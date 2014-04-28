TwitterApp.Views.TweetView = Backbone.View.extend({
	initialize: function(){
		this.template = _.template($('#tweetView').html());
		this.render();
	},

	render: function(){
		this.$el.html(this.template(this.model.toJSON()));
	}
});
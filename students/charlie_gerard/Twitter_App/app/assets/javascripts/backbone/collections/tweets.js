TwitterApp.Collections.Tweets = Backbone.Collection.extend({
	url: '/tweets',
	model: TwitterApp.Models.Tweet
})
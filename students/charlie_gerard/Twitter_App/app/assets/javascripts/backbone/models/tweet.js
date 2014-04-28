TwitterApp.Models.Tweet = Backbone.Model.extend({
	urlRoot: '/tweets',
	default: {
		content: 'this is some default content'
	}
})
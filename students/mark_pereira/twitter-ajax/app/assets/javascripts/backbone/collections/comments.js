TwitterAjax.Collections.Comments = Backbone.Collection.extend({
	initialize: function (options) {
		this.post_id = options.post_id; //check with Joel what this means
	},
	url: function () {
		var url = ['/posts', this.post_id, 'comments'].join('/');
		return url;
	},
	model: TwitterAjax.Models.Post
});
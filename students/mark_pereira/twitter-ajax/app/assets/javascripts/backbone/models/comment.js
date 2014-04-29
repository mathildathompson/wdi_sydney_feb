TwitterAjax.Models.Comment = Backbone.Model.extend({
	//'/posts/:id/comments', //FIXME //Check with Joel
	urlRoot: function () {
		var url = ['/posts', this.get('post_id'), 'comments'].join('/');
		return url;
	},
	defaults: {
		post_id: null,
		author: 'Some Author',
		content: 'Cool Post Bro'
	}
});
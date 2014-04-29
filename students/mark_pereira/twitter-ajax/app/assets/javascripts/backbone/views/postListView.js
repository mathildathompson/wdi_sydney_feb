TwitterAjax.Views.PostListView = Backbone.View.extend({
	tagName: 'li',
	events: {
		'click': 'viewPost'
	},
	initialize: function () {
		this.template = _.template($('#postListView').html());
	},
	render: function () {
		this.$el.html(this.template(this.model.toJSON()));
		return this;
	},
	viewPost: function (event) {
		event.preventDefault();
		TwitterAjax.router.navigate('posts/' + this.model.get('id'), true);
	}
});
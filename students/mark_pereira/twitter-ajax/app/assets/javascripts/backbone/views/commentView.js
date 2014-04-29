TwitterAjax.Views.CommentView = Backbone.View.extend({
	tagName: 'div',
	initialize: function () {
		this.template = _.template($('#commentView').html());
	},
	render: function () {
		$('.comments').append(this.template(this.model.toJSON()));
	}
});
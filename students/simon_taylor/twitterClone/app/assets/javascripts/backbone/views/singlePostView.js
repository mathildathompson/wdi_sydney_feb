TwitterClone.Views.SinglePostView = Backbone.View.extend({
  el: '#main',

  initialize: function () {
    this.template = _.template($('#singlePostView').html());
  },

  render: function () {
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  }
});
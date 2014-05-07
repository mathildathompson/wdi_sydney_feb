TwitterClone.Views.PostView = Backbone.View.extend({

  events: {
    'click': 'viewPost'
  },

  viewPost: function () {
    //redirect to the posts url (trigger forces the new route to load and not just the url to be updated)
    TwitterClone.router.navigate('posts/' + this.model.get('id'), {trigger: true});
  },

  initialize: function () {
    //fetch the template from the page
    this.template = _.template($('#postView').html());
  },

  render: function () {
    //set the $el = the template content passing in the model to the template
    this.$el.html(this.template(this.model.toJSON()));
    //return the view when rendering so this can be chained with .el
    return this;
  }
});
TwitterClone.Views.PostListView = Backbone.View.extend({
  el: '#main',

  initialize: function () {
    //fetch the template from the page
    this.template = _.template($('#postListView').html());
  },

  render: function () {
    //set the html to the template content
    this.$el.html(this.template());

    //loop through each post in the collection
    this.collection.each(function(post) {
      //create a new view for this post
      var view = new TwitterClone.Views.PostView({model: post});
      //render the view, get the el, append to #posts
      $('#posts').append(view.render().el);
    });
  }
});
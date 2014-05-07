TwitterClone.Routers.appRouter = Backbone.Router.extend({
  routes: {
    '': 'index',
    'posts/:id': 'showPost'
  },

  index: function () {
    //instansiate the post list view with the posts collection
    var view = new TwitterClone.Views.PostListView({collection: TwitterClone.posts});
    //render the view
    view.render();
  },

  //the :id is passed into the function as the first parameter
  showPost: function (id) {
    //find the post that matches this id
    var post = TwitterClone.posts.get(id);
    //generate an instance of a new view
    var view = new TwitterClone.Views.SinglePostView({model: post});
    //render this view on the page
    view.render();
  }
});

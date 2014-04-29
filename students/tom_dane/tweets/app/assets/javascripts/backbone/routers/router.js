BlogAjax.Routers.appRouter = Backbone.Router.extend({
  routes: {
    '': 'showPost',
    'posts/:id': 'showPost',
    '*anything': 'goHome'
  },

  showPost: function (id) {
    var view = new BlogAjax.Views.AppView({collection: BlogAjax.blogPosts});
    view.render();
    var post = BlogAjax.blogPosts.get(id);
    new BlogAjax.Views.PostView({model: post});
    var comments = new BlogAjax.Views.commentView({collection: BlogAjax.comments})
  },

  goHome: function () {
    document.location.hash = '';
  }
});

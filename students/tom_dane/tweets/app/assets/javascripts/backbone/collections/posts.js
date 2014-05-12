BlogAjax.Collections.Posts = Backbone.Collection.extend({
  url: '/posts',
  model: BlogAjax.Models.Post
});

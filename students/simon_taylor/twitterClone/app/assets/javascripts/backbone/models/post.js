TwitterClone.Models.Post = Backbone.Model.extend({
  urlRoot: '/posts',
  defaults: {
    author: 'Unknown',
    content: 'Put Content Here...'
  }
});
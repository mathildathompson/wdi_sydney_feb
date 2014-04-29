BlogAjax.Models.Comment = Backbone.Model.extend({
  //'/posts/:id/comments', // FIXME
  urlRoot: function () {
    var url = ['/posts', this.get('post_id'), 'comments'].join('/');
    return url;
  },
  defaults: {
    post_id: null,
    author: 'Some Author',
    content: 'Cool post, bro'
  }
});
BlogAjax.Collections.Comments = Backbone.Collection.extend({
  initialize: function (options) {
    this.post_id = 1
  },
  url: function () {
    var url = ['/posts', 1, 'comments'].join('/');
    return url;
  },
  model: BlogAjax.Models.Post
});

// 1. create router
// 2. include all routes and their mothods
// 3. create the router instance and load on body load
// 4. test all routes with console.log messages

// 5. next we define the models
// 6. and the collection

// 7. create some test content
// 8. now you can test in browser that all your model objects are there eg. blogPosts.models[0].attributes

// 9. add a view to render eg var view = new AppView({collection: blogPosts});
// view.render();

// 10. add the view object
// 11. add a basic templet the the index page

// 5 creating the models
var Post = Backbone.Model.extend({
  idAttribute: 'slug',
  defaults: {
    title: 'New Post Title',
    content: 'New post content'
  }
});

// 6 the collection
var Posts = Backbone.Collection.extend({
  model: Post
});

// 7 a test post
var blogPosts = new Posts([
  new Post({id:1, title:'web dev', slug: 'web-dev', content:'Lorem get fucked'}),
  new Post({id:2, title:'phartography', slug: 'phartography', content:'Lorem get rooted'}),
  new Post({id:3, title:'design', slug: 'design', content:'Lorem get lost'}),
  new Post({id:4, title:'coffeee', slug: 'I_FUCKING_NEED_COFFEEEE', content:'Rucking focks <img src="http://images.idiva.com/media/content/2013/Sep/coffee1.jpg">'}),
]);

// 10 add the view 
var AppView = Backbone.View.extend({
  // where will this view be drawn
  el: '#main',
  
  // initialize by adding the template to the view
  initialize: function(){
    // go look for the template on the index page and compile it
    this.template = _.template($('#appView').html());
  },

  render: function(){
    // get this template and stick it into the el: element on page
    this.$el.html(this.template());

    // now send all of this to the view for each item int he collections
    this.collection.each(function(post){
      var view = new PostListView({model: post});
      view.render();
      $('#posts').append(view.el);
    });
  }
});

// the view for the actual post item in the main page
var PostListView = Backbone.View.extend({
  tagName: 'li',

  events: {
    'click': 'viewPost'
  },
  
  initialize: function(){
    this.template = _.template($('#postListView').html() );
  },

  render: function(){
    this.$el.html(this.template(this.model.toJSON() ) );
  },

  // this method is called by the click event defined above
  viewPost: function(event){
    // get the router instance, and use it to navigate accordng to the posts id
    event.preventDefault();
    router.navigate('posts/' + this.model.get('slug'), true);
    console.log('you clicked a post');
  }
});


var PostView = Backbone.View.extend({
  el: '#main',
  
  initialize: function(){
    this.template = _.template($('#postView').html() );
    this.render();
  },

  render: function(){
    this.$el.html(this.template(this.model.toJSON() ) )
  }

})


// 1-2 router routes
var AppRouter = Backbone.Router.extend({
  routes:{
    '': 'index', // index page
    'posts/:id': 'showPost', //post page by id
    '*anything': 'goHome' // 404 route
  },

  // here we need a method to match each route start with basics ie.
  // showPost: function(id){
  //   console.log('post page')
  // },

  // index page
  // 9 - add a view 
  index: function(){
    var view = new AppView({collection: blogPosts});
    view.render();
    console.log('index page')
  },

  // index.html#posts/12
  showPost: function(slug){
    // setup the post in question from the id in the url
    var post = blogPosts.get(slug);
    new PostView({model: post});
    console.log('post page')
  },

  // 404 error page
  goHome: function(){
    console.log('404')
  }

});

// 3-4 create an instance of the above router
var router = new AppRouter ();
$(document).ready(function(){
  Backbone.history.start();
});

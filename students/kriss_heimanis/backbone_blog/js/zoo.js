var id = 0
var Animal = Backbone.Model.extend({
  defaults: {
    type: 'animal',
    ecosystem: '',
    stripes: 0
  },

  initialize: function(){
    this.set('animalID': id++)
    this.on('change:type', function(){
      var type = model.get('type');
      console.log('I am now a ' + type);
    })
  }
});

var Zoo = Backbone.Collection.extend({
  model: Animal
})

var animal1 = new Animal({type: 'giraffe', ecosystem: 'savannah'});
var animal2 = new Animal({type: 'zebra', ecosystem: 'savannah', stripes: 12});
var animal3 = new Animal({type: 'short giraffe', ecosystem: 'mowed savannah'});

var myZoo = new Zoo([animal1, animal2, animal3]); // this is a collection

var ZooView = Backbone.View.extend({
  el: '#main', // the element on the page where you want to output this view 
  
  initialize: function(){
    this.template = _.template($('#animal-template').html());
  },
  
  render: function(){
    // empty the target element and add the h1
    this.$el.html('<h1>Welcome to the zoo</h1>');
    // create an empty ul for the animals
    this.$el.append('<ul id="animals"></ul>');
    // create a template
    var view = this
    // append the info for each of the models in the collection
    this.collection.each(function(animal){
      $('#animals').append(view.template(animal.toJSON() ) );
    });
  }
});

var AppRouter = Backbone.Router.extend({
  routes: {
    "": "index",
    "animals/:id": "viewAnimal"
  },
  index: function(){
    var zooView = new ZooView({collection: myZoo});
    zooView.render();
  },
  viewAnimal: function(){
    alert("viewign fucking animal" + id)
  }
});

$(document).ready(function(){
  var router = new AppRouter();
  Backbone.history.start();
});
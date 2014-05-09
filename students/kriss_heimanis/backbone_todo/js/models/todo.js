var app = app || {};

//----------------------------------------------------------
// Task Model - title and completed attributes
//----------------------------------------------------------

app.Task = Backbone.Model.extend({

  // defaults
  default: {
    title: '',
    completed: false
  },

  toggle: function(){
    this.save({
      completed: !this.get('completed')
    });
  }

});
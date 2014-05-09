var app = app || {};

//----------------------------------------------------------
// Task Collection - using local storage. w00t.
//----------------------------------------------------------

var TaskList = Backbone.Collection.extend({

  // reference the model
  model: app.Task,

  // save all tasks
  localStorage: new Backbone.LocalStorage('tasks-backbone'),

  // filter all completed tasks
  completed: function(){
    return this.filter(function(todo){
      return todo.get('completed');
    });
  },

  // filter all uncomplete tasks
  remaining: function(){
    return this.without.apply(this, this.completed());
  },

  // keep it all in sequential order
  nextOrder: function(){
    if(!this.length){
      return 1;
    }
    return this.last().get('order') + 1;
  },

  // tasks are sorted by original order
  comparator: function(task){
    return task.get('order');
  }
});

// create global Collection
app.Tasks = new TaskList();
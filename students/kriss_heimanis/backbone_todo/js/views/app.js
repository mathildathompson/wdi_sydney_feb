var app = app || {};

//----------------------------------------------------------
// The Actual Application View
//----------------------------------------------------------

app.AppView = Backbone.View.extend({

  // I think this says we will only now deal with the #taskapp div
  el: '#taskapp',

  // setup the stats template
  statsTemplate: _.template( $('#stats-template').html() ),

  // create new events..?
  events: {
    'keypress #new-task': 'createOnEnter',
    'click #clear-completed': 'clearCompleted',
    'click #toggle-all': 'toggleAllComplete'
  },

  initialize: function(){
    this.allCheckbox = this.$('#toggle-all')[0];
    this.$input = this.$('#new-task');
    this.$footer = this.$('#footer');
    this.$main = this.$('#main');

    this.listenTo(app.Tasks, 'add', this.addOne);
    this.listenTo(app.Tasks, 'reset', this.addAll);

    this.listenTo(app.Tasks, 'change:completed', this.filterOne);
    this.listenTo(app.Tasks,'filter', this.filterAll);
    this.listenTo(app.Tasks, 'all', this.render);
  },

  // refresh stats on render, the rest of the app gets left alone
  render: function() {
    var completed = app.Tasks.completed().length;
    var remaining = app.Tasks.remaining().length;

    if ( app.Tasks.length ) {
      this.$main.show();
      this.$footer.show();

      this.$footer.html(this.statsTemplate({
        completed: completed,
        remaining: remaining
      }));

      this.$('#filters li a')
        .removeClass('selected')
        .filter('[href="#/' + ( app.TodoFilter || '' ) + '"]')
        .addClass('selected');
    } else {
      this.$main.hide();
      this.$footer.hide();
    }
    this.allCheckbox.checked = !remaining;
  },

  // add a task by first creating a view and then appending it to the ul
  addOne: function(task){
    var view = new app.TaskView({model: task});
    $('#task-list').append(view.render().el);
  },

  // add all items to the collection at once
  addAll: function(){
    this.$('#task-list').html('');
    app.Tasks.each(this.addOne, this);
  },

  filterOne : function (task) {
    task.trigger('visible');
  },

  filterAll : function(){
    app.Tasks.each(this.filterOne, this);
  },

  // genrate attiburtes for new task
  newAttributes: function() {
    return {
      title: this.$input.val().trim(),
      order: app.Tasks.nextOrder(),
      completed: false
    };
  },

  // save to local storage
  createOnEnter: function( event ) {
    if ( event.which !== ENTER_KEY || !this.$input.val().trim() ) {
      return;
    }

    app.Tasks.create( this.newAttributes() );
    this.$input.val('');
  },

  // clear completed tasks
  clearCompleted: function() {
    _.invoke(app.Tasks.completed(), 'destroy');
    return false;
  },

  // New
  toggleAllComplete: function() {
    var completed = this.allCheckbox.checked;

    app.Tasks.each(function( task ) {
      task.save({
        'completed': completed
      });
    });
  }

});
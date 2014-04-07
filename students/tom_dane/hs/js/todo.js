$(document).ready(function () {

  $('#tasks').on('click', '.task button', function () {
    var $task = $(this).closest('.task');

    var taskID = $task.attr('data-taskID');
    var task = jsTodoApp.tasks[taskID];
    task.completedAt = (new Date()).toString();

    console.log('you completed this task', task);

    $task.fadeOut(function () {
      jsTodoApp.showTasks();
    });
  });

  $('#completed').on('click', '.task button', function () {
    var $task = $(this).closest('.task');

    var taskID = $task.attr('data-taskID');
    var task = jsTodoApp.tasks[taskID];
    delete task.completedAt;

    console.log('you uncompleted this task', task);

    $task.fadeOut(function () {
      jsTodoApp.showTasks();
    });
  });

  $('form.task_creator').on('submit', function (event) {
    event.preventDefault();
    var $input = $('#new_task');
    var description = $input.val();
    $input.val('');
    jsTodoApp.createTask(description);
    jsTodoApp.showTasks();
    console.log(jsTodoApp.tasks);
  });
});

var jsTodoApp = {
  tasks: [],
  nextID: 0,
  createTask: function (description) {
    var task = {
      'description': description,
      createdAt: (new Date()).toString(),
      id: this.nextID++
    };

    this.tasks.push(task);
    return task;
  },

  showTasks: function () {
    $('.task').remove();

    var task_format = $('#task_template').html();
    var task_html = _.template(task_format);

    // Display each of the incomplete tasks.
    _.each(jsTodoApp.tasks, function (task) {
      var html = task_html(task);
      if (task.completedAt) {
        $(html).appendTo('#completed');
      } else {
        $(html).appendTo('#tasks');
      }
    });
  }
};
$(document).ready(function() {
    $('.task button').on('click',function(){
        console.log('thanks')
        var $task = $(this).closest('.task');
        $task.fadeOut(function(){
            $task.appendTo('#completed').fadeIn()


         var taskID = $task.attr('data-taskID');
         var task = jsTodoApp.tasks[taskID];
         task.completedAt = (new Date()).toString()
         $tasks.find('button').text('incomplete')    
        });
    });

    $('form.task_creator').on('submit',function (event){

        event.preventDefault();
        var $input = $('#new_task');
        var description = $input.val();
        $input.val('');
        jsTodoApp.createTask(description)

    });


});

var jsTodoApp = {
    tasks: [];
    createTask: function(description){
    nextID = 0
        var task = {

            'description': description
            'createdAt': (new Date()).toString()
            id: this.nextID++
        }
        this.tasks.push(task);
        return task;

    }
    showTasks: function() {

        _.each(tasks, function(task) (){

            $('<p>' + task.description + '</p>').appendto('#tasks')


        })

    };


    jsTodoApp.createTask('first task');
    jsTodoApp.createTask('eat burger');
    jsTodoApp.createTask('vomit');

};
$(function(){
    $.ajax({
        url:'/jsonpoll',

    })
    .done(
        function(data){
            console.log(data)
        }
    )
    .fail(
        function(){
            console.log('error..............')
        }
    )
});
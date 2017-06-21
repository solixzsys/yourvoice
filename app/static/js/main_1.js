$(function(){
    sessionStorage.setItem('num',0);
    $.ajax({
        url:'/jsonpoll',
        data:{'page':'0'}

    })
    .done(
        function(data){
            // console.log(data)
            h=$('#titletext')
            optionajax(data[0]['fields'].poll_code)
             h.append(data[0]['fields'].poll_question)
        }
    )
    .fail(
        function(){
            console.log('error..............')
        }
    )


    var makeajax=function(page){

         $.ajax({
        url:'/jsonpoll',
        data:{'page': page}

    })
    .done(
        function(data){
            // console.log(data)
             optionajax(data[0]['fields'].poll_code)
            h=$('#titletext')
             h.html(data[0]['fields'].poll_question).hide().show('slow')
        }
    )
    .fail(
        function(){
            console.log('error..............')
            sessionStorage.num=-1;
        }
    )

}



var optionajax=function(code){

         $.ajax({
        url:'/jsonpolloption',
        data:{'code': code}

    })
    .done(
        function(data){
            // console.log(data)
            console.log('ssss'+data.length)
            a=$('#optionarea')
            a.html("")
            for(var i=0;i<data.length;i++){
                 a.append('<li class="list-group-item radio"><label><input type="radio" name="optionsRadios" id="optionsRadios'+i+' value="option'+i+' checked>'+data[i]['fields'].polloption_text+'</li></label></li>').hide().show('slow')
            }
            //  a.html(data[0]['fields'].polloption_text)
            
        }
    )
    .fail(
        function(){
            console.log('error..............')
            
        }
    )

}





$('#next').on('click',function(){
    if(sessionStorage.num){
        sessionStorage.num=Number(sessionStorage.num)+1;
    
    }
    makeajax(sessionStorage.num);
})

});
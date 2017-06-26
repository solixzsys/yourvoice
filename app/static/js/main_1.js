$(function(){
    sessionStorage.setItem('num',0);
    $.ajax({
        url:'/jsonpoll',
        data:{'page':'0','section':'Economy'}

    })
    .done(
        function(data){
            // console.log('from 1..............'+data)
            h=$('#titletext')
            optionajax(data[0]['fields'].poll_code)
             h.html(data[0]['fields'].poll_question)
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
        data:{'page': page,'section':'Economy'}

    })
    .done(
        function(data){
             console.log('...........................'+data[0])
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
            // console.log('from 1..............'+data)
            // console.log('ssss'+data.length)
            a=$('#optionarea')
            a.html("")
            for(var i=0;i<data.length;i++){
                 a.append('<li class="optionslist'+i+'   list-group-item radio"><label><input type="radio" name="optionsRadios" id="optionsRadios'+i+' value="option'+i+' checked><span class="optext">'+data[i]['fields'].polloption_text+'</span></li></label></li>').hide().show('slow')
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




$('#navctrl').on('click',function(){
    $('#sidebar_id').css({'width':'250px'});
    $('#content').css({'margin-left':'250px'});

})

$('.closebtn').on('click',function(){
    $('#sidebar_id').css({'width':'0'});
    $('#content').css({'margin-left':'0'});
})






sessionStorage.setItem('num2',0);
    $.ajax({
        url:'/jsonpoll',
        data:{'page':'0','section':'Others'}

    })
    .done(
        function(data){
            //  console.log('from 2..............'+data)
            h=$('#titletext2')
            optionajax2(data[0]['fields'].poll_code)
             h.html(data[0]['fields'].poll_question)
        }
    )
    .fail(
        function(){
            console.log('error..............')
        }
    )


    var makeajax2=function(page){

         $.ajax({
        url:'/jsonpoll',
        data:{'page': page,'section':'Others'}

    })
    .done(
        function(data){
            // console.log(data)
             optionajax2(data[0]['fields'].poll_code)
            h=$('#titletext2')
             h.html(data[0]['fields'].poll_question).hide().show('slow')
        }
    )
    .fail(
        function(){
            console.log('error..............')
            sessionStorage.num2=-1;
        }
    )

}



var optionajax2=function(code){

         $.ajax({
        url:'/jsonpolloption',
        data:{'code': code}

    })
    .done(
        function(data){
            // console.log(data)
            //console.log('ssss'+data.length)
            a=$('#optionarea2')
            a.html("")
            for(var i=0;i<data.length;i++){
                 a.append('<li  class="optionslist'+i+'  list-group-item radio"><label><input type="radio" name="optionsRadios" id="optionsRadios'+i+' value="option'+i+' checked><span class="optext">'+data[i]['fields'].polloption_text+'</span></li></label></li>').hide().show('slow')
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





$('#next2').on('click',function(){
    if(sessionStorage.num2){
        sessionStorage.num2=Number(sessionStorage.num2)+1;
    
    }
    makeajax2(sessionStorage.num2);
})


















});
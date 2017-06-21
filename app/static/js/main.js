$(function(){
var msgs=$('.msg1 h2')
    $(window).scroll(function(){
        
        for(var i=0;i<msgs.length;i++){

        if($($('.msg1 h2')[i]).visible()==true){
            $($('.msg1 h2')[i]).addClass('textanim')
        console.log('msg1 visible.........................');

    }else{
        $($('.msg1 h2')[i]).removeClass('textanim')
        console.log('msg1 not visible.........................');
    }
        }

     if($('.textboard').visible()==true){
            $('.textboardwrapper div').addClass('.textboardanim')
        console.log(' .textboard visible.........................');

    }else{
        $('.textboardwrapper div').removeClass('.textboardanim')
        console.log('.textboard not visible.........................');
    }


    if($('.mybox').visible()==true){
        $('nav').addClass('hidden').hide().show('slow')   
        console.log(' mybox visible.........................');

    }else{
        $('nav').removeClass('hidden') 
        console.log('mybox not visible.........................');
    }




    })
    
})
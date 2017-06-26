$(function(){
var msgs=$('.msg1 h2')
    $(window).scroll(function(){
        
        for(var i=0;i<msgs.length;i++){

        if($($('.msg1 h2')[i]).visible()==true){
            $($('.msg1 h2')[i]).addClass('textanim')
        // console.log('msg1 visible.........................');

    }else{
        $($('.msg1 h2')[i]).removeClass('textanim')
        // console.log('msg1 not visible.........................');
    }
        }

     if($('.textboard').visible()==true){
            $('.textboardwrapper div').addClass('.textboardanim')
        // console.log(' .textboard visible.........................');

    }else{
        $('.textboardwrapper div').removeClass('.textboardanim')
        // console.log('.textboard not visible.........................');
    }


    if($('.mybox').visible(true,true)==false){
        //$('nav').addClass('hidden').hide().show('normal')
        // $('nav').removeClass('hidden') 
         $('nav').slideDown('slow')
        // console.log(' mybox visible.........................');
// if(parseInt($('#sidebar_id').css('width'))<1){
//     $('#sidebar_id').css({'width':'250px'});
    // $('body').css({'margin-left':'250px'});
 }else{
//     $('#sidebar_id').css({'width':'0'});
//     // $('body').css({'margin-left':'0'});

//     }
        $('nav').slideUp('slow')
        
       // $('nav').addClass('hidden') 
        // console.log('mybox not visible.........................');
    }




})



$('.toggleit').on('click',function(){
    if(parseInt($('#sidebar_id').css('width'))<1){
    $('#sidebar_id').css({'width':'250px'});
    // $('body').css({'margin-left':'250px'});
}else{
    $('#sidebar_id').css({'width':'0'});
    // $('body').css({'margin-left':'0'});

    }

})

$('.closebtn').on('click',function(){
    $('#sidebar_id').css({'width':'0'});
    // $('body').css({'margin-left':'0'});
})


$('#navbtn').on('click',function(){
    console.log('navbtn click................................')
    if($(window).width()<768){
        console.log('less than 768................................')
       if(parseInt($('#sidebar_id').css('width'))<1){
    $('#sidebar_id').css({'width':'250px'});
    // $('body').css({'margin-left':'250px'});
}else{
    $('#sidebar_id').css({'width':'0'});
    // $('body').css({'margin-left':'0'});
console.log('navbtn click................................')
    }
    }
})
    
})
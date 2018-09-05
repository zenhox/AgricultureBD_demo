$('.top_tittle .menus li').each(function(){
    $('.top_tittle .menus li').mouseover(function(){
        $('.top_tittle .menus li').removeClass('bg');
        $(this).addClass('bg');
    })
})
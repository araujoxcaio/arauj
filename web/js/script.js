$( 'document' ).ready(function(){
    $("#dropdownCliente").hide();
    $("#dropdownForn").hide();
    
    $('#item-menu-cliente').mouseenter(function(){
        $("#item").addClass("item");
        $("#dropdownCliente").stop(true, true).show(400);   
    });
    $("#item-menu-cliente").mouseleave(function(){
        $("#dropdownCliente").stop(true, true).hide(250);
        $("#item").removeClass("item");
    });
    $('#item-menu-forn').mouseenter(function(){
        $("#dropdownForn").stop(true, true).show(400);   
    });
    $("#item-menu-forn").mouseleave(function(){
        $("#dropdownForn").stop(true, true).hide(250);
    });
});


$(document).ready(function(){
    $(".table-row-click").click(function() {
        window.location = $(this).data("href");
    });
    
    $("#table-fornecedores").DataTable( {
        language: {
            url: 'https://cdn.datatables.net/plug-ins/1.10.12/i18n/Portuguese-Brasil.json'
        },
        "lengthChange": false,
        "info": false,
        "ordering": false
    });
    $("#table-clientes").DataTable( {
        language: {
            url: 'https://cdn.datatables.net/plug-ins/1.10.12/i18n/Portuguese-Brasil.json'
        },
        "lengthChange": false,
        "info": false,
        "ordering": false
    });
});


$(document).ready(function () {
    $(".dropdown-menu li").click(function () {
        var selText = $(this).text();
        $(this).closest('.input-group-btn').children('button').html(selText + ' <span class="caret"></span>')
    });
});
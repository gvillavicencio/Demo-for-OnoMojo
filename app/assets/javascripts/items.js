/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function() {
    $("a[href=\"/items/new\"]").live("click",function(e){
        e.preventDefault();
        var a_clicked = $(this);
        $.ajax({
            type: 'GET',
            url: a_clicked.attr("href"),
            success: function(data){
                $("#ajax_content").html(data);
            }
        });
    });

    $('#item_list').delegate("a[href*=\"items\"][href*=\"edit\"]","click",function(e){
        e.preventDefault();
        var a_clicked = $(this);
        $.ajax({
            type: 'GET',
            url: a_clicked.attr("href"),
            success: function(data){
                $("#ajax_content").html(data);
            }
        });
    });

});
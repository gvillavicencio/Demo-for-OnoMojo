/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function() {
    $("a#add_new_item").live("click",function(e){
        e.preventDefault();
        var href = $(this).attr("href");
        $.ajax({
            type: 'GET',
            url: href,
            success: function(data){
                $("#ajax_content").html(data);
            }
        });
    });

    $('a.edit_user').live("click",function(e){
        e.preventDefault();
        var href = $(this).attr("href");
        $.ajax({
            type: 'GET',
            url: href,
            success: function(data){
                $("#ajax_content").html(data);
            }
        });
    });

    $("form#new_item").live("ajax:success",function(jObject,data){
        if(data.error == "true"){
            check_form_error(data.errors);            
        }else{
            $('div#notice').html("").append("Item created");
            $('div#new_item_form').fadeOut();
            $('form :input').val("");
        }
    });

    $("form.edit_item").live("ajax:success",function(jObject,data){
        if(data.error == "true"){
            check_form_error(data.errors);
        }else{
            $('div#notice').html("").append("Item updated");
            $('div#edit_item_form').fadeOut();
            $('form :input').val("");
        }
    });

    $("a.delete_item").live("ajax:success",function(jObject,data){
        $("#item_"+data.item_deleted.id).fadeOut("slow",function(){
            $(this).remove();
        });
    });

    function check_form_error(error){
        if(error.name != null)
            $("input#item_name").css("border","1px solid red");
        else
            $("input#item_name").removeAttr("style");

        if(error.color != null)
            $("input#item_color").css("border","1px solid red");
        else
            $("input#item_color").removeAttr("style");

        if(error.user_id != null)
            $("select#item_user_id").css("border","1px solid red");
        else
            $("select#item_user_id").removeAttr("style");
    }
});
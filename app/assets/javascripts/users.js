/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function() {    
    $("a#add_new_user").live("click",function(e){
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

    $("form#new_user").live("ajax:success",function(jObject,data){
        if(data.error == "true"){
            console.log(data.errors);
            check_form_error(data.errors);
        }else{            
            $('div#notice').html("").append("User created");
            $('div#new_user_form').fadeOut();
            $('form :input').val("");
            $('#home_users').append("<option value='"+data.user.id+"'>"+data.user.name+"</option>");
        }
    });

    $("form.edit_user").live("ajax:success",function(jObject,data){
        if(data.error == "true"){
            check_form_error(data.errors);
        }else{
            $('div#notice').html("").append("User updated");
            $('div#edit_user_form').fadeOut();
            $('form :input').val("");
            $("select#home_users option[value='"+data.user.id+"']").text(data.user.name);
        }
    });

    $("a.delete_user").live("ajax:success",function(jObject,data){
        $("#user_"+data.user_deleted.id).fadeOut("slow",function(){
            $(this).remove();
            $("select#home_users option[value='"+data.user_deleted.id+"']").remove();
        });
    });


    function check_form_error(error){
        if(error.name != null)
            $("input#user_name").css("border","1px solid red");
        else
            $("input#user_name").removeAttr("style");

        if(error.last_name != null)
            $("input#user_last_name").css("border","1px solid red");
        else
            $("input#user_last_name").removeAttr("style");
    }
});
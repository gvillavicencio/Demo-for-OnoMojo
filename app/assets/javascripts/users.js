/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function() {
    $("a[href=\"/users/new\"]").live("click",function(e){
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

    $('#user_list').delegate("a[href*=\"users\"][href*=\"edit\"]","click",function(e){
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

    $("form#new_user").live("ajax:success",function(jObject,data){
        if(data.error == "true"){
            console.log(data.errors);
        }else{            
            var div_notice = $('div#notice');
            div_notice.html("");
            div_notice.append("User created");
            $('div#new_user_form').fadeOut();
            $('form :input').val("");
            $('#home_users').append("<option value='"+data.user.id+"'>"+data.user.name+"</option>");
        }
    });

    $("form.edit_user").live("ajax:success",function(jObject,data){
        if(data.error == "true"){
            console.log(data.errors);
        }else{
            var div_notice = $('div#notice');
            div_notice.html("");
            div_notice.append("User updated");
            $('div#edit_user_form').fadeOut();
            $('form :input').val("");
            $("select#home_users option[value='"+data.user.id+"']").text(data.user.name);
        }
    });
});
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function() {
    $('#home_users').change(function () {
        if($(this).val() > 0){
            load_ajax("/users/"+$(this).val());
        }
    });

    $("a").live("click",function(e){
        e.preventDefault();
        if($(this).attr("href") == "/users" || $(this).attr("href") == "/items"){
            $("#home_users").val("0");
            load_ajax($(this).attr("href"));
        }
    });

    function load_ajax(href){
        $.ajax({
            type: 'GET',
            url: href,
            success: function(data){
                $("#ajax_content").html(data);
            }
        });
    }

    
});


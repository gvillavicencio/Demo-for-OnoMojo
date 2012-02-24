/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function() {
    $('#home_users').change(function () {
        select_val = $(this).val();
        if(select_val > 0){
            load_ajax("/users/"+select_val);
        }
    });

    $("a").live("click",function(e){
        e.preventDefault();
        var a_clicked = $(this);
        if(a_clicked.attr("href") == "/users" || a_clicked.attr("href") == "/items"){
            $("#home_users").val("0");
            load_ajax(a_clicked.attr("href"));
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


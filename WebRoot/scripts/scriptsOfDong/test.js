/**
 * Created by msi on 2017/5/28.
 */



$(function(){
    var _boxCon=$(".box-con");
    $(".move-signup").on("click",function(){
        $('.box-con').css({
            'marginLeft':-320
        })

    });

    $(".move-login").on("click",function(){

        $(_boxCon).css({
            'marginLeft':0
        })

    });
})

/*$(document).ready(function(){
	$("p").click(function(){
		$(this).hide();
	});
});*/

$(document).ready(function(){
	$("foot").click(function(){
		$(this).hide();
	});
});
$(document).ready(function(){
	$(".choo").click(function(){
		alert("test");
	});
});

$("#allc").change(function(){
	var innum=$(".choo").length;
	if($(this).prop("checked")){
		$(".choo").prop("checked",true);
		$("#in_num").text(innum);
//		$(".lskdo").val(1);
		$("#sp_num").text(innum);
		$(".lskdo").prop("disabled",false);
	}
	else{
		$(".choo").prop("checked",false);
		$("#in_num").text(0);
//		$(".lskdo").val(0);
		$("#sp_num").text(0);
		$(".lskdo").prop("disabled",true);
	}
})
$(".choo").change(function(){
	var lskd=$(".choo:checked").length;
	$("#in_num").text(lskd);
	var lsoe=$(this).parent().parent().find(".lskdo");
	if($(this).prop("checked")){
		lsoe.prop("disabled",false);
//		lsoe.val(1);
		$("#sp_num").text(parseInt($("#sp_num").text())+parseInt(lsoe.val()));
		//alert();
	}else{
		lsoe.prop("disabled",true);
		$("#sp_num").text(parseInt($("#sp_num").text())-parseInt(lsoe.val()));
//		lsoe.val(0);
	}
})

//$(".jian").each(function(){
$(".jian").click(function(){
	var lskdpd=$(this).parent().parent().find(".choo");
	var lsoek=$(this).parent().find(".lskdo");
	//alert(lsoek.val()>1);
	if(lskdpd.prop("checked")&&lsoek.val()>1){
		//alert("ccc");
		var lskoe=parseInt(lsoek.val());
		var eiow=parseInt($("#sp_num").text());
		//alert(eiow);
		lsoek.val(lskoe-1);
		$("#sp_num").text(eiow-1);
	}else{}
})
//})
//$(".jia").each(function(){
$(".jia").click(function(iiii){
	var lskdpd=$(this).parent().parent().find(".choo");
	var lsoek=$(this).parent().find(".lskdo");
	//alert(lsoek.val()>1);
	if(lskdpd.prop("checked")){
		//alert("ccc");
		var lskoe=parseInt(lsoek.val());
		var eiow=parseInt($("#sp_num").text());
		lsoek.val(lskoe+1);
		$("#sp_num").text(eiow+1);
		//return $("#sp_num").text();
	}else{}
})
//})
$(".lskdo").on('input propertychange',function(){
	var deox=$(this).val();
	if(isNaN(deox)){
		alert("���,���������빺�������!");
		$(this).val(1);
	}
	var loel=0;
	for(i=0;i<$(".lskdo").length;i++){
		//alert($(".lskdo").eq(i).val());
		loel=parseInt(loel)+parseInt($(".lskdo").eq(i).val());
	}
	//alert(loel);
	$("#sp_num").text(loel);
})
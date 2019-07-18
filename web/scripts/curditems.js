


function getItemNames(itemType)
{
    
var text=$("#"+itemType).text();
if(text.indexOf("+")!==-1)
{
$("#"+itemType).text("-"+itemType);    
$("#s"+itemType).show(500); 
//$("#div1").show(); 

}
else if(text.indexOf("-")!==-1)
{
$("#"+itemType).text("+"+itemType);    
$("#s"+itemType).hide(1000);
$("#div1").hide();   
}

}
function aud(operation)
{
    var request=$.post(operation+"product.jsp",pprocess);
    request.error(handleError); 
  
   
}
function pprocess(responseText)
{
$("#div1").html(responseText);
$("#div1").show();
//   ajaxreq.open(“POST” , “index.jsp” , true);
//
//         ajaxreq.setRequestHeader(“content-type” , “application/x-www- form-urlencoded”); 							form-urlencoded”);
//
//          ajaxreq.send(“roll=10”):

}
function addProduct()
{
    var pname=$("#pname").val();alert(pname);
    var ptype=$("#ptype").val();
    var pdesc=$("#pdesc").val();
    var pprice=$("#pprice").val();
    var pimage=$("#pimage").val();
    alert(pimage);
    var image=document.getElementById("pimage").files[0].name;
    
    var data={image:image};
    var request=$.post("Image",data,re);
}
function re(responseText)
{
    alert(responseText);
}




//function addProduct()
//{
//    var form = $('#fileUploadForm')[0];alert(form);
//    var data = new FormData(form);
//    alert(data);
//    var pname=$("#pname").val();alert(pname);
//    var ptype=$("#ptype").val();
//    var pdesc=$("#pdesc").val();
//    var pprice=$("#pprice").val();
//    data.append("pname",pname);
//    data.append("ptype",ptype);
//    data.append("pdesc",pdesc);
//    data.append("pprice",pprice);alert(data);
//    $.ajax({
//            type: "POST",
//            enctype: 'multipart/form-data',
//            url: "AddNewProductControllerServlet",
//            data: data,
//            processData: false,
//            contentType: false,
//            cache: false,
//            timeout: 600000
////            success: function (data) {
////
////                $("#addresp").html(data);
////                
////                
////
////            },
////            error: function (e) {
////
////                $("#addresp").html(e.responseText);
////                
////                
////
////            }
//        });
//        }
 function removeUser(username,usertype)     // for removing user details,     
 {
     location.reload();
     uname=username;
    utype=usertype;
     var mydata={memberusername:username ,memberusertype:usertype};
var request=$.post("AdminControllerServlet",mydata);
request.error(handleError);  
     
     
     
 } 
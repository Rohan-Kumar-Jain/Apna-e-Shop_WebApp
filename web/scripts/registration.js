/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(
        function()
        {
          $("#registerbtn").click( function(){doTask();});    
        }
        );

function doValidate()
{
    $("#regresult").css("display","inline");
    $("#regresult").text("");
     $("#sp1").css("display","inline");
    $("#sp1").text("");
     $("#sp2").css("display","inline");
    $("#sp2").text("");
    var status=true;
if($("#username").val()==="")
{
    $("#sp1").text("field req!!");
    $("#sp1").css("color","red");
    $("#sp1").css("font-weight","bold");
    $("#sp1").fadeOut(4000);
    status=false;
   
}
if($("#password").val()==="")
{
    $("#sp2").text("field req!!");
    $("#sp2").css("color","red");
    $("#sp2").css("font-weight","bold");
    $("#sp2").fadeOut(4000);
    status=false;
   
}
return status;
}
 function doTask()
{
    var ans=doValidate();
    if(ans==false){return;}
    else
    {
     var data={username:$("#username").val(),password:$("#password").val()};
       var XHR=$.post("RegistrationControllerServlet",data,processResponse );
    }
}
function processResponse(responseText)
{
   if(responseText.trim()==='success')
   {
    $("#regresult").css("display","inline");
    $("#regresult").text("");
    $("#regresult").html("Registered successfully!!<br>Now you can <a href='login.html'>login</a>");
    $("#regresult").css("color","green");
    $("#regresult").css("font-weight","bold");
    $("#loginresult").fadeOut(4000);
    $("#username").val("");
    $("#password").val("");
    
    
    
}
    else if(responseText.trim()==='uap')
    {
    $("#regresult").css("display","inline");
    $("#regresult").text("");
    $("#regresult").text("Username already available!!");
    $("#regresult").css("color","red");
    $("#regresult").css("font-weight","bold");
    $("#regresult").fadeOut(4000);
     $("#username").val("");
    $("#password").val("");
    }
     else if(responseText.trim()==='failure')
    {
    $("#regresult").css("display","inline");
    $("#regresult").text("");
    $("#regresult").text("Some internal problem occur");
    $("#regresult").css("color","red");
    $("#regresult").css("font-weight","bold");
    $("#regresult").fadeOut(4000);
     $("#username").val("");
    $("#password").val("");
    
    }
   else 
   {     
    $("#regresult").css("display","inline");
    $("#regresult").text("");
    $("#regresult").text("server is expericing some problem");
    $("#regresult").css("color","red");
    $("#regresult").css("font-weight","bold");
    $("#regresult").fadeOut(4000);
     $("#username").val("");
    $("#password").val("");
    
    
   }
  
}



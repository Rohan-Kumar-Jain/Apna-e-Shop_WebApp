
$(document).ready(
        function()
        {
          $("#loginbtn").click( function(){doTask();});    
        }
        );

function doValidate()
{
    $("#loginresult").css("display","inline");
    $("#loginresult").text("");
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
     var data={username:$("#username").val(),password:$("#password").val(),usertype:$("#usertype").val()};
       var XHR=$.post("LoginControllerServlet",data,processResponse );
    
    }
}
function processResponse(responseText)
{
   if(responseText.trim()==='error')
   {
    $("#loginresult").css("display","inline");
    $("#loginresult").text("");
    $("#loginresult").text("Login Rejected!! ");
    $("#loginresult").css("color","red");
    $("#loginresult").css("font-weight","bold");
    $("#loginresult").fadeOut(4000);
    $("#username").val("");
    $("#password").val("");
    }
    else if(responseText.trim()==='exception')
    {
    $("#loginresult").css("display","inline");
    $("#loginresult").text("");
    $("#loginresult").text("Server is experienced some problems.");
    $("#loginresult").css("color","red");
    $("#loginresult").css("font-weight","bold");
    $("#loginresult").fadeOut(4000);
    }
   else
   {    var r; 
       if($("#usertype").val()=='ADMIN')
       {r="option";}
       else
       {
           r="store";
       }
    $("#loginresult").css("display","inline");
    $("#loginresult").text("");
    $("#loginresult").html("Login Accepted! <br>Redirecting to "+r+" page......");
    $("#loginresult").css("color","green");
    $("#loginresult").css("font-weight","bold");
    $("#loginresult").fadeOut(4000);
    setTimeout(function(){window.location=responseText;},3000);
   }
  
}


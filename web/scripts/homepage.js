/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready
(
function()
{
 $("#nextbtn").click( function(){doTask();});  
}
);
function doValidate()
{
    $("#result").css("display","inline");
    $("#result").text("");
    var status=true;
    reg=$("#rbtnReg").is(':checked');
    log=$("#rbtnLog").is(':checked');
if($("#rbtnReg").is(':checked')==false && $("#rbtnLog").is(':checked')==false)
{
    $("#result").text("Please select an Option first");
    $("#result").css("color","red");
    $("#result").css("font-weight","bold");
    $("#result").fadeOut(4000);
    status=false;
   
}return status;
}
 function doTask()
{
var ans=doValidate();
    if(ans==false)
    {return;}
    if(reg==true)
    {
        window.location="registration.html";
    }
    else
    {
           window.location="login.html";
    
    }
}
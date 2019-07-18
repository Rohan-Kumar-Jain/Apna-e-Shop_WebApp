/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var item;
function getItemNames(itemType)
{
item=itemType;
var para=document.getElementById(itemType);
var span=para.getElementsByTagName("span")[0];
var spantext=span.innerHTML.trim();
if(spantext.indexOf("+")!==-1)
{
span.innerHTML="-"+itemType;    
}
else if(spantext.indexOf("-")!==-1)
{
    span.innerHTML="+"+itemType;
    $("#"+item+".itemnames").hide("slow");
    return;
}

var mydata={itemType:itemType};
var request=$.post("StoreControllerServlet",mydata,processResponse);
request.error(handleError);
}

function processResponse(responseText)
{
var para=document.getElementById(item);
var resp=responseText;
resp=resp.trim();
var olddiv=para.getElementsByClassName("itemnames")[0];
if(typeof olddiv!=='undefined')
{
    para.removeChild(olddiv);
}
var newdiv=document.createElement("div");
newdiv.setAttribute("class","itemnames");
newdiv.setAttribute("id",item);
newdiv.innerHTML=resp;
para.appendChild(newdiv);
}
function handleError(x,textStatus)
{
    
}
var ee;
function remove(id,price,a)
{
    $("#"+id).remove();
    var ss=parseInt($("#price").text());
   // alert(ss);
    ss=ss-price;//alert(ss);
    ee=ss;
    $("#price").text(ss);
    a++;
    var mydata={itemId:id};
var request=$.post("CPCControllerServlet",mydata,process);
request.error(handleError);    
}
function process(responseText)
{
    
}
var order;
function details(orderId)
{
order=orderId;
var mydata={orderId:orderId};//alert(orderId);
var request=$.post("StoreControllerServlet",mydata,pprocess);
request.error(handleError);  

}
function pprocess(responseText)
{  
  $("#r").show();
  $("#r").html(responseText);
}
function erase(ss)
{
  $(ss).hide();

}
function  price()
{
return ee;    
}
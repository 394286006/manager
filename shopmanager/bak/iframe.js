// JavaScript Document
/**
			 * @author minn
			 * @QQ 394286006
			 * @email freemanfreelift@gmail.com
	 */
		var pageArr=new Array();
		var frontid="";
		
	function layer2back(event){
		setLayer(frontid,-5);
	}
	function createIframeDiv(id){
		
       bringAllOther2End();
	   pageArr.push(id);
	   frontid=id;
	   var node=document.createElement("div");
	   node.setAttribute("id",id);
	   node.style.position = "absolute";
	   node.style.background="transparent";
	   node.style.border = "0px";
	   node.style.visibility= "hidden";
       node.scroll="yes";
	   document.body.appendChild(node);
	   node.addEventListener("mouseout",layer2back,true);

	}
	function removeIFrame(id){
		
		 var n=document.body.removeChild(document.getElementById(id));
		 //var n1=n.removeChild(document.getElementById("iframe"+id));
		 //n1.src=null;
		// n.removeEventListener("mouseout",layer2back,true);
		 // n1.clearAttributes();
		 //n1.normalize();
		// n.clearAttributes();
		// n.normalize();
		// n1.close();
		// n.close();
		// n1=null;
		// n=null;
		 var newPageArr=new Array();
		 for(var i=0;i<pageArr.length;i++){
			 if(pageArr[i]!=id){
				 newPageArr.push(pageArr[i]);
			 }
		 }
		 
		 pageArr=newPageArr;
	}
	function bringAllOther2End(){
		
	  for(var i=0;i<pageArr.length;i++){
		     document.getElementById(pageArr[i]).style.zIndex=-15;
		     hideIFrame(pageArr[i]);
	  }
	}
	function bring2Front(id){
		
	  for(var i=0;i<pageArr.length;i++){
	     if(pageArr[i]==id){
		    document.getElementById(pageArr[i]).style.zIndex=-5;
		    showIFrame(pageArr[i]);
				frontid=pageArr[i];
		  }else{
		     document.getElementById(pageArr[i]).style.zIndex=-15;
		     hideIFrame(pageArr[i]);
		     }
	  }
	}
	
	function bring2End(id){
	 frontid=id;
	 document.getElementById(id).style.zIndex=-5;
	}
    function moveIFrame(id,x,y,w,h) {
		var frameRef=document.getElementById(id);
		frameRef.style.left=x;
		frameRef.style.top=y;
		var iframeid="iframe"+id;
		var iFrameRef=document.getElementById(iframeid);
		iFrameRef.width=w;
		iFrameRef.height=h;
	 }

	function hideIFrame(id){
		document.getElementById(id).style.visibility="hidden";
	}
	
	function showIFrame(id){

		document.getElementById(id).style.visibility="visible";
	}
        
	function loadIFrame(id,url){
		var iframeid="iframe"+id;

		 document.getElementById(id).innerHTML="<iframe id='"+iframeid+"' src='"+url+"' onmouseout='layer2back(event)' frameborder='0'></iframe>";
	
	 }
	function setLayer(id,lay){
		var w=document.getElementById(id);
		if(w!=null)
	    w.style.zIndex=lay;
	}
	 function call(){
		 //alert('called first');
		//alert("iframe"+frontid);
	  var n= document.getElementById("iframe"+frontid);
	 alert(n);
	   n.call2();
	 //alert( n.src.document); 
	  // n.src.call2();
	 }  
	  function call3(){
		 alert('called 3');
		// alert(parent);
	  //var n= document.getElementById("iframe"+frontid);
	 //alert( n.src.document); 
	  // n.src.call2();
	 }  
	 function callBack2(){
		 alert('callback');
		// alert(thisMovie('minn'));
		 thisMovie('minn').callBack();
	 }
	 
	function thisMovie(movieName){
  		 if(navigator.appName.indexOf("Microsoft")!=-1) {
            return window[movieName];
       } else {
          return document[movieName];
        }
  }
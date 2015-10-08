<html>
<head>
<title></title>

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script>
$(document).ready(function() {

	if (navigator.userAgent.match(/Android/i) ||
             navigator.userAgent.match(/webOS/i) ||
             navigator.userAgent.match(/iPhone/i) ||
             navigator.userAgent.match(/iPod/i) ||
             navigator.userAgent.match(/BlackBerry/) || 
             navigator.userAgent.match(/Windows Phone/i) || 
             navigator.userAgent.match(/ZuneWP7/i)
             ) {

                self.location="http://m.marydesa.com";
               }

		$('img#btn_enviar').click(function() { 

			var nome = $('#input_nome').val();
			var email = $('#input_email').val();
			var mensagem = $('#input_message').val();			

			if( nome!= "" && email!="" && mensagem !=""){
			
				 $.ajax({
                    type: 'post',
                    url: "/php/mail.php",
                    data: {'nome': nome,'email':email,'mensagem':mensagem},
                    success: function (e) {
							alert("Mensagem enviada! Obrigado");
                    },
                    error:function (erro) {
								alert("Desculpe, ocorreu um erro ao enviar a mensagem");
                    }
                });
          }else
          alert("Preencha os campos corretamente");     
          e.preventDefault();
                
		});
		
});
</script>

<style>

body{
	font-family: Verdana,Arial, Geneva, Helvetica, sans-serif;
	margin:0;
	padding:0;
/*	
	background: -webkit-linear-gradient(#c0a67e, #c7b088,#bfa678); /* For Safari */
	background: -o-linear-gradient(#c0a67e, #c7b088,#bfa678); /* For Opera 11.1 to 12.0 */
	background: -moz-linear-gradient(#c0a67e, #c7b088,#bfa678); /* For Firefox 3.6 to 15 */
	background: linear-gradient(#c0a67e, #c7b088,#bfa678); /* Standard syntax */


background: -webkit-radial-gradient(#c0a67e,f0e9df,white,f0e9df,#bfa678); /* Safari */
background: -o-radial-gradient(#c0a67e,f0e9df,white,f0e9df,#bfa678); /* For Opera 11.1 to 12.0 */
background: -moz-radial-gradient(#c0a67e,f0e9df,white,f0e9df,#bfa678); /* For Firefox 3.6 to 15 */
background: radial-gradient(#c0a67e,f0e9df,white,f0e9df,#bfa678); /* Standard syntax */
*/

background: #ffffff; /* Old browsers */
/* IE9 SVG, needs conditional override of 'filter' to 'none' */
background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPHJhZGlhbEdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgY3g9IjUwJSIgY3k9IjUwJSIgcj0iNzUlIj4KICAgIDxzdG9wIG9mZnNldD0iMCUiIHN0b3AtY29sb3I9IiNmZmZmZmYiIHN0b3Atb3BhY2l0eT0iMSIvPgogICAgPHN0b3Agb2Zmc2V0PSIzMiUiIHN0b3AtY29sb3I9IiNmY2Y5ZmEiIHN0b3Atb3BhY2l0eT0iMSIvPgogICAgPHN0b3Agb2Zmc2V0PSI2NSUiIHN0b3AtY29sb3I9IiNkOWNhYjEiIHN0b3Atb3BhY2l0eT0iMSIvPgogICAgPHN0b3Agb2Zmc2V0PSI5OSUiIHN0b3AtY29sb3I9IiNjMGE2N2UiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvcmFkaWFsR3JhZGllbnQ+CiAgPHJlY3QgeD0iLTUwIiB5PSItNTAiIHdpZHRoPSIxMDEiIGhlaWdodD0iMTAxIiBmaWxsPSJ1cmwoI2dyYWQtdWNnZy1nZW5lcmF0ZWQpIiAvPgo8L3N2Zz4=);
background: -moz-radial-gradient(center, ellipse cover,  #ffffff 0%, #fcf9fa 32%, #d9cab1 65%, #c0a67e 99%); /* FF3.6+ */
background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%,#ffffff), color-stop(32%,#fcf9fa), color-stop(65%,#d9cab1), color-stop(99%,#c0a67e)); /* Chrome,Safari4+ */
background: -webkit-radial-gradient(center, ellipse cover,  #ffffff 0%,#fcf9fa 32%,#d9cab1 65%,#c0a67e 99%); /* Chrome10+,Safari5.1+ */
background: -o-radial-gradient(center, ellipse cover,  #ffffff 0%,#fcf9fa 32%,#d9cab1 65%,#c0a67e 99%); /* Opera 12+ */
background: -ms-radial-gradient(center, ellipse cover,  #ffffff 0%,#fcf9fa 32%,#d9cab1 65%,#c0a67e 99%); /* IE10+ */
background: radial-gradient(ellipse at center,  #ffffff 0%,#fcf9fa 32%,#d9cab1 65%,#c0a67e 99%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#c0a67e',GradientType=1 ); /* IE6-8 fallback on horizontal gradient */

	
}

#all{
	width:100%;
	height:100%;

	background-image: url(images/brilho_topT.png),url(images/back_strip.png);
	background-repeat: no-repeat,no-repeat,no-repeat;
	background-position: center top,center top,center top;
}

#content{


	width:1000px;
	height:100%;
	margin: 0 auto;
	padding-top:0;
	
	
}


img#mulher{
	/*
	height:654px;
	width:470px;
	*/

	height:654px;
	width:532px;
	float:left;
		z-index:8;
}

img#descript{
	align:right;
	height:590px;
	width:400px;
	padding-top:94px;
	float:right;
	z-index:9;
}

#bottom{
	position:absolute;
	z-index:10;
}

#text_descript{

	position:absolute;
	z-index:10;
	color:white;
	margin-left:625px;
	margin-top:295px;
	font-size:13px;
	line-height:22px;
	color:#efeff0;
	
}

#text_descript2{

	position:absolute;
	z-index:10;
	color:white;
	margin-left:625px;
	margin-top:505px;
	font-size:13px;
	line-height:22px;
		color:#efeff0;
	
}



#bottom_brilho{
	height:277px;
	width:1000px;
	margin-top:400px;

}

#form{
	position:absolute;
	z-index:12;
	margin-top:345px;
	margin-left:150px;
	transform: rotate(-3deg);
	-ms-transform: rotate(-3deg); /* IE 9 */
	-webkit-transform: rotate(-3deg); /* Safari and Chrome */
	color:#58595b;
}


div#div_nome{

	height:25px;
	width:232px;
/*	background:#d6d8d9;*/
	font-size:12px;

	padding-left:5px;

}

div#div_email{

	margin-top:5px;
	height:25px;
/*	background:#d6d8d9;*/
		font-size:12px;

	padding-left:5px;
	width:232px;

}

div#div_message{

	margin-top:25px;
	height:120px;
	width:225px;

	font-size:12px;
	padding-top:6px;
	padding-left:10px;
	
/* background:#d6d8d9;*/	

}

input{
	color:#58595b;
}
TEXTAREA{

	background:none;
	font-family: Verdana,Arial, Geneva, Helvetica, sans-serif;
	color:#58595b;
	border:0;
	overflow:hidden;
}


input#input_nome{

	background:none;
	border:0;
	height:24px;
	width:170px;
	margin-left:45px;
	
	
}

input#input_email{

	background:none;
	border:0;
	height:24px;
	width:170px;
	margin-left:45px;
	
	
}

#btn_enviar{
	position:absolute;
	border:0;
	margin-top:500px;
	margin-left:330px;
	padding-left:15px;
	padding-right:15px;
	cursor:pointer;
	height:70px;
	width:70px;
	z-index:20;
		transform: rotate(-3deg);
	-ms-transform: rotate(-3deg); /* IE 9 */
	-webkit-transform: rotate(-3deg); /* Safari and Chrome */
	
}

*:focus {
    outline: 0;
}


img#img_bola{

	position:absolute;
	margin-left:500px;
	

}

</style>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" >
</head>

<body>
<div id="all" >

<div id="content">

	<div id="form">
				
		<div id="div_nome"><input id="input_nome" type="text" maxlength="40"/></div>
		<div id="div_email"><input id="input_email" type="text" maxlength="40"/></div>
		<div id="div_message">
		<TEXTAREA id="input_message" ROWS=6 COLS=25 maxlength="180"></TEXTAREA> 
		</div>

	</div>
				<div id="div_send"><img id="btn_enviar" src="images/btn_enviar.png" /></div>
				<div id="bottom">
				<img id="bottom_brilho" src="images/bottom_brilhoTT.png" />
				</div>	
	
		<img id="mulher" src="images/mulhertttt.png" />
		<img id="descript" src="images/descriptTTT.png" />
		<img id="img_bola" src="images/img_bola.png" />
	</div>
</div>

</body>
</html>

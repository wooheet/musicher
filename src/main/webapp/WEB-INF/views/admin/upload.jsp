<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
table {
    border-collapse: separate;
   
}

th, td {
    text-align: left;
   
}

tr:nth-child(even){background-color: white;}
tr:nth-child(odd){background-color: white;}
</style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Musicher</title>
    <script type="text/javascript">
    
    
    
   table = document.getElementById("tablelist");
		function createAddRow(){
			var num = window.prompt("업로드할 숫자를 입력하세요");
			for (var int = 0; int < num; int++) {
				
				//1. 테이블에 row가 추가될때 삽입될 폼객체를 생성
				var title = document.createElement("input")
				title.setAttribute("type", "text")
				var upFile = document.createElement("input")
				upFile.setAttribute("type", "file")
				upFile.setAttribute("name", "upFile")
				var btnDel = document.createElement("input")
				btnDel.setAttribute("type", "button")
				btnDel.setAttribute("value", "삭제")
				
				
				//2. 행이 추가될 테이블을 찾아오기
				var mytable = document.getElementById("tablelist");
				btnDel.setAttribute("onclick", "deleteRow(this)")
				
				//3. 테이블에 행<tr>을 추가하기
				
				var row = mytable.insertRow(mytable.rows.length);
				
				//4. 행에 각 셀을 추가하기
				var mycell01 = row.insertCell(0);
				var mycell02 = row.insertCell(1);
				var mycell03 = row.insertCell(2);
				
				//5. 셀에 양식태그를 추가
				mycell01.appendChild(title);
				mycell02.appendChild(upFile);
				mycell03.appendChild(btnDel);
				
				
				
				
			}
			
			
		}
		function deleteAllRow(){
			var mytable = document.getElementById("tablelist");
			var i = mytable.rows.length;
			
			for (var int = 0; int <  i; int++) {
				
				mytable.childNode.remove();
				
				
			}
			
			
			
		}
		
		function deleteRow(obj){
			$(obj).parent().parent().remove();
			
			
			
			
		}
	</script>
<!--

Template 2086 Multi Color

http://www.tooplate.com/view/2086-multi-color

-->
    <!-- load stylesheets -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">  
    <!-- Google web font "Open Sans" -->
    <link rel="stylesheet" href="/Musicher/resources/recommand_font-awesome-4.5.0/css/font-awesome.min.css">                
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/Musicher/resources/recommand_css/bootstrap.min.css">                                      
    <!-- Bootstrap style -->
    <link rel="stylesheet" href="/Musicher/resources/recommand_css/hero-slider-style.css">                              
    <!-- Hero slider style (https://codyhouse.co/gem/hero-slider/) -->
    <link rel="stylesheet" href="/Musicher/resources/recommand_css/magnific-popup.css">                                 
    <!-- Magnific popup style (http://dimsemenov.com/plugins/magnific-popup/) -->
    <link rel="stylesheet" href="/Musicher/resources/recommand_css/tooplate-style.css">                                   

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
          <![endif]-->
</head>
<body>
        
        <!-- Content -->
        <div class="cd-hero">

            <!-- Navigation -->        
            <div class="cd-slider-nav">
                <nav class="navbar">
                    <div class="tm-navbar-bg">
                        
                        <a class="navbar-brand text-uppercase" href="#"><i class="fa fa-gears tm-brand-icon"></i>Recommand Music</a>

                        <!-- <button class="navbar-toggler hidden-lg-up" type="button" data-toggle="collapse" data-target="#tmNavbar">
                            &#9776;
                        </button> -->
                         <div class="collapse navbar-toggleable-md text-xs-center text-uppercase tm-navbar" id="tmNavbar">
                            <ul class="nav navbar-nav">
                                <li class="nav-item active selected">
                                    <a class="nav-link" href="#0" data-no="0">업로드 <span class="sr-only">(current)</span></a>
                                </li>                                                            
                                <li class="nav-item">
                                    <a class="nav-link" href="#0" data-no="1">통계</a>
                                </li>
                             
                            </ul>
                        </div>                        
                    </div>

                </nav>
            </div> 

            <ul class="cd-hero-slider">

                <!-- Page 1 Gallery One -->
                <li class="selected">                    
                    <div class="cd-full-width">
                        <div class="container-fluid js-tm-page-content" data-page-no="1" data-page-type="gallery">
                            <div class="tm-img-gallery-container">
                                
                                <!-- Gallery One pop up connected with JS code below -->                                    
                                                                       
		                            	
		                            	<input type="button" value="업로드 추가" onclick="createAddRow()" >
		                            	 
		                            	 <form method="post" enctype="multipart/form-data" action="/Musicher/upload.do">
			                            	 <table id="tablelist" border="1">
			                            	 
												<tr >
													<th>Title</th>
													<th>File</th>
													<th>Delete</th>
												</tr>
												<tr >
													<td><input type="text" name="title" /></td>
													<td><input type="file" name="upFile" /></td>
													<td><input type="button" onclick= "deleteRow(this)" value="삭제"/></td>
													
												</tr>
											
													
											</table>
											<input type="submit" value="file send" />
											</form>
											
											<h1><a href="/Musicher/memberlist.do">회원목록보기</a>
											</h1>
								
                                    
                                                               
                            </div>
                        </div>                                                    
                    </div>                    
                </li>

         

                
        

        <!-- Preloader, https://ihatetomatoes.net/create-custom-preloading-screen/ -->
        <div id="loader-wrapper">
            
            <div id="loader"></div>
            <div class="loader-section section-left"></div>
            <div class="loader-section section-right"></div>

        </div>
        
        <!-- load JS files -->
        <script src="/Musicher/resources/recommand_js/jquery-1.11.3.min.js"></script>         <!-- jQuery (https://jquery.com/download/) -->
        <script src="https://www.atlasestateagents.co.uk/javascript/tether.min.js"></script> <!-- Tether for Bootstrap (http://stackoverflow.com/questions/34567939/how-to-fix-the-error-error-bootstrap-tooltips-require-tether-http-github-h) --> 
        <script src="/Musicher/resources/recommand_js/bootstrap.min.js"></script>             <!-- Bootstrap js (v4-alpha.getbootstrap.com/) -->
        <script src="/Musicher/resources/recommand_js/hero-slider-main.js"></script>          <!-- Hero slider (https://codyhouse.co/gem/hero-slider/) -->
        <script src="/Musicher/resources/recommand_js/jquery.magnific-popup.min.js"></script> <!-- Magnific popup (http://dimsemenov.com/plugins/magnific-popup/) -->
        
        <script>

            function adjustHeightOfPage(pageNo) {

                var offset = 80;
                var pageContentHeight = 0;

                var pageType = $('div[data-page-no="' + pageNo + '"]').data("page-type");

                if( pageType != undefined && pageType == "gallery") {
                    pageContentHeight = $(".cd-hero-slider li:nth-of-type(" + pageNo + ") .tm-img-gallery-container").height();
                }
                else {
                    pageContentHeight = $(".cd-hero-slider li:nth-of-type(" + pageNo + ") .js-tm-page-content").height() + 20;
                }

                if($(window).width() >= 992) { offset = 120; }
                else if($(window).width() < 480) { offset = 40; }
               
                // Get the page height
                var totalPageHeight = $('.cd-slider-nav').height()
                                        + pageContentHeight + offset
                                        + $('.tm-footer').height();

                // Adjust layout based on page height and window height
                if(totalPageHeight > $(window).height()) 
                {
                    $('.cd-hero-slider').addClass('small-screen');
                    $('.cd-hero-slider li:nth-of-type(' + pageNo + ')').css("min-height", totalPageHeight + "px");
                }
                else 
                {
                    $('.cd-hero-slider').removeClass('small-screen');
                    $('.cd-hero-slider li:nth-of-type(' + pageNo + ')').css("min-height", "100%");
                }
            }

            /*
                Everything is loaded including images.
            */
            $(window).load(function(){

                adjustHeightOfPage(1); // Adjust page height

                /* Gallery One pop up
                -----------------------------------------*/
                $('.gallery-one').magnificPopup({
                    delegate: 'a', // child items selector, by clicking on it popup will open
                    type: 'image',
                    gallery:{enabled:true}                
                });
				
				/* Gallery Two pop up
                -----------------------------------------*/
				$('.gallery-two').magnificPopup({
                    delegate: 'a',
                    type: 'image',
                    gallery:{enabled:true}                
                });

                /* Gallery Three pop up
                -----------------------------------------*/
                $('.gallery-three').magnificPopup({
                    delegate: 'a',
                    type: 'image',
                    gallery:{enabled:true}                
                });

                /* Collapse menu after click 
                -----------------------------------------*/
                $('#tmNavbar a').click(function(){
                    $('#tmNavbar').collapse('hide');

                    adjustHeightOfPage($(this).data("no")); // Adjust page height       
                });

                /* Browser resized 
                -----------------------------------------*/
                $( window ).resize(function() {
                    var currentPageNo = $(".cd-hero-slider li.selected .js-tm-page-content").data("page-no");
                    
                    // wait 3 seconds
                    setTimeout(function() {
                        adjustHeightOfPage( currentPageNo );
                    }, 1000);
                    
                });
        
                // Remove preloader (https://ihatetomatoes.net/create-custom-preloading-screen/)
                $('body').addClass('loaded');
                           
            });

            /* Google map
            ------------------------------------------------*/
            var map = '';
            var center;

            function initialize() {
                var mapOptions = {
                    zoom: 14,
                    center: new google.maps.LatLng(37.769725, -122.462154),
                    scrollwheel: false
                };
            
                map = new google.maps.Map(document.getElementById('google-map'),  mapOptions);

                google.maps.event.addDomListener(map, 'idle', function() {
                  calculateCenter();
                });
            
                google.maps.event.addDomListener(window, 'resize', function() {
                  map.setCenter(center);
                });
            }

            function calculateCenter() {
                center = map.getCenter();
            }

            function loadGoogleMap(){
                var script = document.createElement('script');
                script.type = 'text/javascript';
                script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&' + 'callback=initialize';
                document.body.appendChild(script);
            }
        
            // DOM is ready
            $(function() {                
                loadGoogleMap(); // Google Map
            });

        </script>            

</body>
</html>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<meta charset="utf-8">
<title>audio.js</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta content="width=device-width, initial-scale=0.6" name="viewport">
<style>
body {
	color: #666;
	font-family: sans-serif;
	line-height: 1.4;
}

h1 {
	color: #444;
	font-size: 1.2em;
	padding: 14px 2px 12px;
	margin: 0px;
}

h1 em {
	font-style: normal;
	color: #999;
}

a {
	color: #888;
	text-decoration: none;
}

#wrapper {
	width: 400px;
	margin: 40px auto;
}

ol {
	padding: 0px;
	margin: 0px;
	list-style: decimal-leading-zero inside;
	color: #ccc;
	width: 460px;
	border-top: 1px solid #ccc;
	font-size: 0.9em;
}

ol li {
	position: relative;
	margin: 0px;
	padding: 9px 2px 10px;
	border-bottom: 1px solid #ccc;
	cursor: pointer;
}

ol li a {
	display: inline;
	text-indent: -3.3ex;
	padding: 0px 0px 0px 20px;
}

li.playing {
	color: #aaa;
	text-shadow: 1px 1px 0px rgba(255, 255, 255, 0.3);
}

li.playing a {
	color: #000;
}

li.playing:before {
	content: '♬';
	width: 14px;
	height: 14px;
	padding: 3px;
	line-height: 14px;
	margin: 0px;
	position: absolute;
	left: -24px;
	top: 9px;
	color: #000;
	font-size: 13px;
	text-shadow: 1px 1px 0px rgba(0, 0, 0, 0.2);
}

#shortcuts {
	position: fixed;
	bottom: 0px;
	width: 100%;
	color: #666;
	font-size: 0.9em;
	margin: 60px 0px 0px;
	padding: 20px 20px 15px;
	background: #f3f3f3;
	background: rgba(240, 240, 240, 0.7);
}

#shortcuts div {
	width: 460px;
	margin: 0px auto;
}

#shortcuts h1 {
	margin: 0px 0px 6px;
}

#shortcuts p {
	margin: 0px 0px 18px;
}

#shortcuts em {
	font-style: normal;
	background: #d3d3d3;
	padding: 3px 9px;
	position: relative;
	left: -3px;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-o-border-radius: 4px;
	border-radius: 4px;
	-webkit-box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
	-moz-box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
	-o-box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
	box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
}

@media screen and (max-device-width: 480px) {
	#wrapper {
		position: relative;
		left: -3%;
	}
	#shortcuts {
		display: none;
	}
}

.credit {
	text-align: center;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="/Musicher/resources/audiojs/audio.js"></script>
<script>
	$(function() {
		// Setup the player to autoplay the next track
		var a = audiojs.createAll({
			trackEnded : function() {
				var next = $('ol li.playing').next();
				if (!next.length)
					next = $('ol li').first();
				next.addClass('playing').siblings().removeClass('playing');
				audio.load($('a', next).attr('data-src'));
				audio.play();
			}
		});

		// Load in the first track
		var audio = a[0];
		first = $('ol a').attr('data-src');
		$('ol li').first().addClass('playing');
		audio.load(first);

		// Load in a track on click
		$('ol li').click(function(e) {
			e.preventDefault();
			$(this).addClass('playing').siblings().removeClass('playing');
			audio.load($('a', this).attr('data-src'));
			audio.play();
		});
		// Keyboard shortcuts
		$(document).keydown(function(e) {
			var unicode = e.charCode ? e.charCode : e.keyCode;
			// right arrow
			if (unicode == 39) {
				var next = $('li.playing').next();
				if (!next.length)
					next = $('ol li').first();
				next.click();
				// back arrow
			} else if (unicode == 37) {
				var prev = $('li.playing').prev();
				if (!prev.length)
					prev = $('ol li').last();
				prev.click();
				// spacebar
			} else if (unicode == 32) {
				audio.playPause();
			}
		})
	});
</script>
<script type="text/javascript">
	function opnerReload() {
		window.opener.focus()
	};

	function musicClick(musicID) {
		num = parseInt(musicID);
		filenum = prependZero(num, 6);
		var musicTr = $('.playMusic');
		musicTr.attr('data-src',
				"https://archive.org/download/pj32017-08-28.pj3pj3/" + filenum
						+ ".mp3");
	};

	function prependZero(num, len) {
		while (num.toString().length < len) {
			num = "0" + num;
		}
		return num;
	}
	
	
	var musicid = "";
	function recomm(str) {
		musicid = str	
	}
	
	$(document).ready(function() {
		$(".recommend").on("click", function() {
			$.get("/Musicher/insertRecommend", {
				"musicID" : musicid,
				"userID" : '${loginUser.mem_id}'
			}, success_recommend)

		})

		function success_recommend(txt) {
			alert('asdf')
		}

	})
	
	
</script>
</head>
<body onload="opnerReload()">
	<div class="container" align="center">
		<h1>
			Music list <em>${loginUser.name}</em>
		</h1>

		<audio preload></audio>
		<c:if test="${mymusiclist != null}">

			<ol style="padding-left: 10px">
				<c:forEach var="mymusic" items="${mymusiclist}">
					<fmt:formatNumber value="${mymusic.music_id}" var="filename"
						pattern="000000" />
					<%-- ${filename } --%>
					<c:set var="TextValue" value="${filename}" /> ${fn:substring(TextValue,0,3) }
					
					<li class="recommend" onmouseover="recomm('${mymusic.music_id}')">
						<%-- <li onclick="location.href='/Musicher/insertRecommend.do?musicID=${mymusic.music_id}&userID=${loginUser.mem_id}'"> --%>
						<a href="#" class="playMusic" align="left"
						
						data-src="/Musicher/resources/music/${fn:substring(TextValue,0,3) }/${filename }.mp3">
							${mymusic.title} - ${mymusic.singer}</a> <span
						style="width: 50px; height: 7px"
						onclick="location.href='/Musicher/delmymusicpopup.do?music_id=${mymusic.music_id}&mem_id=${loginUser.mem_id}'">
							<i class="glyphicon glyphicon-remove"></i>
					</span>
					</li>
					<!-- <li><a href="#" class="playMusic"
						data-src="https://archive.org/download/pj32017-08-28.pj3pj3/008259.mp3">두번째곡</a></li> -->
				</c:forEach>
			</ol>
		</c:if>

		<%-- 
		<table align="center" class="table table-hover">
			<thead>
				<tr>
					<th>musicNo</th>
					<th>노래제목</th>
					<th>가수</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>

				<c:if test="${mymusiclist != null}">
					<c:forEach var="mymusic" items="${mymusiclist}">
						<tr id="musicClick" value=""
							onclick="musicClick('${mymusic.music_id}')">
							<td>${mymusic.music_id}</td>
							<td>${mymusic.title}</td>
							<td>${mymusic.singer}</td>
							<td><div style="width: 50px; height: 7px"
									onclick="location.href='/Musicher/delmymusicpopup.do?music_id=${mymusic.music_id}&mem_id=${loginUser.mem_id}'">
									<i class="glyphicon glyphicon-remove"></i>
								</div></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
 --%>

	</div>
	<!-- 	<div id="shortcuts">
		<div>
			<h1>Keyboard shortcuts:</h1>
			<p>
				<em>&rarr;</em> Next track
			</p>
			<p>
				<em>&larr;</em> Previous track
			</p>
			<p>
				<em>Space</em> Play/pause
			</p>
		</div>
	</div> -->

</body>
</html>
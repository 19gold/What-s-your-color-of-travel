<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="menu_notmem.css" rel="stylesheet" type="text/css">
<title>What's your color of travel</title>
</head>
<body>
	<div class="contain">
		<div class="survey">
			<br> <br>
			<img src="img\menu_survey_sz.png" class="menuimg" />
			<div class="title_text">Find My Travel Color</div>
			<img src="img\paint_sz.png" class="paintimg">
			<div class="explain_text">
				Find your own travel style<br>through the survey!
			</div>
			<Button id="btn1" onclick="location.href='surveychange.jsp'">GO
				SURVEY ></Button>
		</div>

		<div class="review_all">

			<br> <br>
			<img src="img\menu_allreview_sz.png" class="menuimg" />
			<div class="title_text">View All Review</div>
			<img src="img\paint_sz.png" class="paintimg">
			<div class="explain_text">
				Take a look at <br>other people's travel records
			</div>
			<Button id="btn2">VIEW ALL
				REVIEW ></Button>
		</div>

		<div class="review_my">
			<br> <br>
			<img src="img\menu_myreview_sz.png" class="menuimg" />
			<div class="title_text">View My Review</div>
			<img src="img\paint_sz.png" class="paintimg">
			<div class="explain_text">
				Look at my own travel records<br>and the color of my feelings!
			</div>
			<Button id="btn2">VIEW MY REVIEW
				</Button>
		</div>
	</div>
</body>
</html>
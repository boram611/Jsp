// JavaScript Document

$(function() {
	var movedIndex = 0;
	
	function moveSlide(index) {
		movedIndex = index;
		
		var moveLeft = -(index * 1250);
		$('#slidePanel').animate({'left':moveLeft}, 'slow');
	}
	
	$('#prevButton').on('click', function() {
		if(movedIndex != 0)
			movedIndex = movedIndex - 1;
		moveSlide(movedIndex);
	});
	
	$('#nextButton').on('click', function() {
		if(movedIndex != 3)
			movedIndex = movedIndex + 1;
		moveSlide(movedIndex);
	});
	
	setInterval(function() {
		if(movedIndex != 3)
			movedIndex = movedIndex + 1;
		else
			movedIndex = 0;
			
		moveSlide(movedIndex);
	},3000);

	$('#controlPanel img').each(function (index) {
		$(this).hover(
			function() {
				$(this).attr('src', 'image/controlButton2.png');
			},
			function() {
				$(this).attr('src', 'image/controlButton1.png');
			}
		);
		
		$(this).on('click', function() {
			moveSlide(index);
		});
	}); 
});
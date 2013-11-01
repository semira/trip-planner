function addDayCard() {
	var newDayCount = parseInt($('#days .day').last().data('itemnum'))+1;
	d=document.createElement('div');
	$(d).addClass('card day')
	    .html("<div class='city'>City</div><footer>Hotel</footer>")
		.attr("data-itemnum", newDayCount)
		.click(function() {
			setModalDefaultValues(this);
			$('#dayModal').modal('show');
		})
	    .appendTo($("#days"))
}

function setModalDefaultValues(day) {
	var currentCity = $(day).children('div.city').html();
	if (currentCity.length > 0 && currentCity !== "City") {
		$('#cityInputBox').val(currentCity);
	} 
	var currentHotel = $(day).children('footer').html();
	if (currentHotel.length > 0 && currentHotel !== "Hotel") {
		$('#hotelInputBox').val(currentHotel);
	}
	$('#correspondingItem').val($(day).data('itemnum'));
}

function clearModalValues() {
	$('#cityInputBox').val('');							
	$('#hotelInputBox').val('');	
	$('#correspondingItem').val('');	
}

function saveDayDetails(itemnum) {
	var newCity = $('#cityInputBox').val();
	if (newCity.length > 0) {
		$('[data-itemnum=' + itemnum + ']').children('div.city').html(newCity);												
	} else { $('[data-itemnum=' + itemnum + ']').children('div.city').html('City'); }

	var newHotel = $('#hotelInputBox').val();
	if (newHotel.length > 0) {
		$('[data-itemnum=' + itemnum + ']').children('footer').html(newHotel);
	} else { $('[data-itemnum=' + itemnum + ']').children('footer').html('Hotel'); }
}
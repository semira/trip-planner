//adds a day card to the end of the list of day cards with placeholder text for city and hotel
function addDayCard() {
	var newDayCount = parseInt($('#days .day-card').last().data('itemnum'))+1;
	d=document.createElement('div');
	$(d).addClass('card day-card')
	    .html("<div class='date'></div><div class='city'>City</div><div class='notes'><small></small></div><div class='hotel'>Hotel</div>")
		.attr("data-itemnum", newDayCount)
		.click(function() {
			setModalDefaultValues(this);
			$('#dayModal').modal('show');
		})
	    .appendTo($("#days"));
	return d;
}

function setModalDefaultValues(day) {
	//TODO: set datepicker default
	var currentCity = $(day).children('div.city').html();
	if (currentCity.length > 0 && currentCity !== "City") {
		$('#cityInputBox').val(currentCity);
	} 
	
	var currentNotes = $(day).children('div.notes').children('small').html();
	if (currentNotes.length > 0) {
		$('#notesInputBox').val(currentNotes);
	}
	
	var currentHotel = $(day).children('div.hotel').html();
	if (currentHotel.length > 0 && currentHotel !== "Hotel") {
		$('#hotelInputBox').val(currentHotel);
	}
	$('#correspondingItem').val($(day).data('itemnum'));
}

function clearModalValues() {
	$('#dateInputBox').val('');	//TODO: make this the next date in the calendar						
	$('#cityInputBox').val('');							
	$('#notesInputBox').val('');	
	$('#hotelInputBox').val('');	
	$('#correspondingItem').val('');	
}

function saveDayDetails(itemnum) {
	var newDate = $('#dateInputBox').val();
	$('[data-itemnum=' + itemnum + ']').children('div.date').html(newDate);												
	
	var newCity = $('#cityInputBox').val();
	if (newCity.length > 0) {
		$('[data-itemnum=' + itemnum + ']').children('div.city').html(newCity);												
	} else { $('[data-itemnum=' + itemnum + ']').children('div.city').html('City'); }

	var newNotes = $('#notesInputBox').val();
	if (newNotes.length > 0) {
		$('[data-itemnum=' + itemnum + ']').children('div.notes').children('small').html(newNotes);												
	} else { $('[data-itemnum=' + itemnum + ']').children('div.notes').children('small').html(''); }

	var newHotel = $('#hotelInputBox').val();
	if (newHotel.length > 0) {
		$('[data-itemnum=' + itemnum + ']').children('div.hotel').html(newHotel);
	} else { $('[data-itemnum=' + itemnum + ']').children('div.hotel').html('Hotel'); }
}

function deleteDay(itemnum) {
	$('[data-itemnum=' + itemnum + ']').remove();
}
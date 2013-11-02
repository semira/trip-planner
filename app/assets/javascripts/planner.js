
// returns the number of day cards in the trip
function numDays () {
	return parseInt($('#days .day-card').last().data('itemnum'));
}

//adds a day card to the end of the list of day cards with placeholder text for city and hotel
function addDayCard() {
	var newDayCount = numDays()+1;
	w=document.createElement('div');
	$(w).addClass('day-card-wrapper')
		.html("<div class='date'></div")
		.appendTo($("#days"));
	d=document.createElement('div');
	$(d).addClass('card day-card')
	    .html("<div class='city'></div><div class='notes'><small></small></div><div class='hotel'>Hotel</div>")
		.attr("data-itemnum", newDayCount)
		.click(function() {
			setModalDefaultValues(this);
			$('#dayModal').modal('show');
		})
	    .appendTo($(w));
	
	return d;
}

//sets the default input values in the modal window to match the day card details, if they exist
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

//clears all values in the day details modal. to be used when the modal is dismissed so that it resets.
function clearModalValues() {
	$('#dateInputBox').val('');	//TODO: make this the next date in the calendar						
	$('#cityInputBox').val('');							
	$('#notesInputBox').val('');	
	$('#hotelInputBox').val('');	
	$('#correspondingItem').val('');	
}

//copies the day details from the modal to the day card. to be used upon click of save button in modal.
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

//removes the associated day card from the list
function deleteDay(itemnum) {
	$('[data-itemnum=' + itemnum + ']').remove();
}

//turns on inline editing for all elements of a given kind, e.g. all Cities in a trip
//editableOptions is a hash that gets passed to the editable() function for bootstrap-editable
function enableInlineEditing(elementName, numElements, editableOptions) {
	for (var i=1; i <= numElements; i++) {
		$('[data-elementID=' + elementName + '-' + i + ']').editable(editableOptions);
	}
}

function updateDates(startingDay) {
	for (var i = startingDay; i >= numDays(); i++) {
		
	}
}

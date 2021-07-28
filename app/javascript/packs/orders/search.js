$(document).ready(function() {
	trackItems()
})

function trackItems() {
	$("#track_element").on('click', function(e){
		e.preventDefault();
		track_id = $("#track_id").val();
		if (track_id && track_id !="") {
			$.ajax({
				type: 'GET',
				url: '/orders/'+track_id,
				dataType: 'script'
			});
			return false;
		} else {
			e.preventDefault();
			alert('Pleae give a track id.')
		}
	})
}
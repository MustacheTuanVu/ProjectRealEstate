/*Export Table Init*/

"use strict"; 

$(document).ready(function() {
	$('#example').DataTable( {
                responsive: true,
		dom: 'Bfrtip',
		buttons: [
			'pdf'
		]
	} );
        
        $('#example1').DataTable( {
		dom: 'Bfrtip',
		buttons: [
			'pdf'
		]
	} );
} );
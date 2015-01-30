/*
\cutFilter

This is a combination of a low cut and a high cut filter. Both filters are cascaded Butterworth filters, and order is settable between 2nd and 8th.


--
this is an Udef definition file
part of the Unit lib default Udefs set
*/

Udef( \cutFilter, { |freq #[ 20, 20000 ], order = 2, lag = 0|
	var in;
	in = UIn.ar(0,1);
	in = BLowCut.ar( in, freq[0].lag(lag).clip(20,20000), order, 4 );
	in = BHiCut.ar( in, freq[1].lag(lag).clip(20,20000), order, 4 );
	UOut.ar( 0, in );
})
	.category_( \filter )
	.setSpec( \freq, \freq.asSpec.asRangeSpec.default_( [20,20000] ) )
	.setSpec( \order, [ 0, 4, \lin, 1, 2 ].asSpec )
	.setSpec( \lag, [0,1,\lin].asSpec )
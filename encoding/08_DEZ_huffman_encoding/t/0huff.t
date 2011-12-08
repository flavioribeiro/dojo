use Test::More;

BEGIN { 
	use_ok( 'Huffman' ); 
}

require_ok( 'Huffman' );

is(Huffman::encode('A'),0,"encode A deveria retornar 0");

done_testing();
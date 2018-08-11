#! @System MapOfFinSets

LoadPackage( "FinSetsForCAP" );

#! @Example
S := FinSet( [ 1, 3, 2, 2, 1 ] );
#! <An object in FinSets>
T := FinSet( [ "a", "b", "c" ] );
#! <An object in FinSets>
G := [ [ 1, "b" ], [ 3, "b" ], [ 2, "a" ] ];;
phi := MapOfFinSets( S, G, T );
#! <A morphism in FinSets>
IsWellDefined( phi );
#! true
phi( 1 );
#! "b"
phi( 2 );
#! "a"
phi( 3 );
#! "b"
List( S, phi );
#! [ "b", "a", "b" ]
psi := [ [ 1, "b" ], [ 2, "a" ], [ 3, "b" ] ];;
psi := MapOfFinSets( S, psi, T );
#! <A morphism in FinSets>
IsWellDefined( psi );
#! true
phi = psi;
#! true


# non-welldefined morphisms
# We create a new source S with a string only appearing in this test file.
# Otherwise, the caching mechanism might compare the following non-welldefined
# morphisms to morphisms in other tests using IsEqualForMorphisms, which might
# throw an error.

S := FinSet( [ 1, 2, "MapOfFinSet.g" ] );;
psi := [ [ 1, "b" ], [ "MapOfFinSets.g", "b" ], [ 2, "a" ], [ 2, "b" ] ];;
psi := MapOfFinSets( S, psi, T );
#! <A morphism in FinSets>
IsWellDefined( psi );
#! false
psi := [ [ 1, "b" ], [ "MapOfFinSets.g", "b" ] ];;
psi := MapOfFinSets( S, psi, T );
#! <A morphism in FinSets>
IsWellDefined( psi );
#! false
psi := [ [ 1, "b" ], [ "MapOfFinSets.g", "b" ], [ 2, "julia" ] ];;
psi := MapOfFinSets( S, psi, T );
#! <A morphism in FinSets>
IsWellDefined( psi );
#! false
#! @EndExample

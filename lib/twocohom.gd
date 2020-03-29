#############################################################################
##
##  This file is part of GAP, a system for computational discrete algebra.
##  This file's authors include Bettina Eick.
##
##  Copyright of GAP belongs to its developers, whose names are too numerous
##  to list here. Please refer to the COPYRIGHT file for details.
##
##  SPDX-License-Identifier: GPL-2.0-or-later
##


#############################################################################
##
#F  CollectedWordSQ( <C>, <u>, <v> ) 
##
##  <ManSection>
##  <Func Name="CollectedWordSQ" Arg='C, u, v'/>
##
##  <Description>
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "CollectedWordSQ" );

#############################################################################
##
#F  CollectorSQ( <G>, <M>, <isSplit> )
##
##  <ManSection>
##  <Func Name="CollectorSQ" Arg='G, M, isSplit'/>
##
##  <Description>
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "CollectorSQ" );

#############################################################################
##
#F  AddEquationsSQ( <eq>, <t1>, <t2> )
##
##  <ManSection>
##  <Func Name="AddEquationsSQ" Arg='eq, t1, t2'/>
##
##  <Description>
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "AddEquationsSQ" );

#############################################################################
##
#F  SolutionSQ( <C>, <eq> )
##
##  <ManSection>
##  <Func Name="SolutionSQ" Arg='C, eq'/>
##
##  <Description>
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "SolutionSQ" );

#############################################################################
##
#F  TwoCocyclesSQ( <C>, <G>, <M> )
##
##  <ManSection>
##  <Func Name="TwoCocyclesSQ" Arg='C, G, M'/>
##
##  <Description>
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "TwoCocyclesSQ" );

#############################################################################
##
#F  TwoCoboundariesSQ( <C>, <G>, <M> )
##
##  <ManSection>
##  <Func Name="TwoCoboundariesSQ" Arg='C, G, M'/>
##
##  <Description>
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "TwoCoboundariesSQ" );

#############################################################################
##
#F  TwoCohomologySQ( <C>, <G>, <M> )
##
##  <ManSection>
##  <Func Name="TwoCohomologySQ" Arg='C, G, M'/>
##
##  <Description>
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "TwoCohomologySQ" );


#############################################################################
##
#O  TwoCocycles( <G>, <M> )
##
##  <#GAPDoc Label="TwoCocycles">
##  <ManSection>
##  <Oper Name="TwoCocycles" Arg='G, M'/>
##
##  <Description>
##  returns the <M>2</M>-cocycles of a pc group <A>G</A> by the
##  <A>G</A>-module <A>M</A>. 
##  The generators of <A>M</A> must correspond to the <Ref Attr="Pcgs"/>
##  value of <A>G</A>. The operation
##  returns a list of vectors over the field underlying <A>M</A> and the 
##  additive group generated by these vectors is the group of
##  <M>2</M>-cocyles.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "TwoCocycles", [ IsPcGroup, IsObject ] );


#############################################################################
##
#O  TwoCoboundaries( <G>, <M> )
##
##  <#GAPDoc Label="TwoCoboundaries">
##  <ManSection>
##  <Oper Name="TwoCoboundaries" Arg='G, M'/>
##
##  <Description>
##  returns the group of <M>2</M>-coboundaries of a pc group <A>G</A> by the
##  <A>G</A>-module <A>M</A>.
##  The generators of <A>M</A> must correspond to the <Ref Attr="Pcgs"/>
##  value of <A>G</A>.
##  The group of coboundaries is given as vector space over the field
##  underlying <A>M</A>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "TwoCoboundaries", [ IsPcGroup, IsObject ] );


#############################################################################
##
#O  TwoCohomology( <G>, <M> )
##
##  <#GAPDoc Label="TwoCohomology">
##  <ManSection>
##  <Oper Name="TwoCohomology" Arg='G, M'/>
##
##  <Description>
##  This operation computes the second cohomology group for the special
##  case of a Pc Group.
##  It returns a record defining the second cohomology group as factor space of 
##  the space of cocycles by the space of coboundaries.
##  <A>G</A> must be a pc group and the generators of <A>M</A> must
##  correspond to the pcgs of <A>G</A>.
##  <Example><![CDATA[
##  gap> G := SmallGroup( 4, 2 );
##  <pc group of size 4 with 2 generators>
##  gap> mats := List( Pcgs( G ), x -> IdentityMat( 1, GF(2) ) );
##  [ [ <a GF2 vector of length 1> ], [ <a GF2 vector of length 1> ] ]
##  gap> M := GModuleByMats( mats, GF(2) );
##  rec( IsOverFiniteField := true, dimension := 1, field := GF(2), 
##    generators := [ <an immutable 1x1 matrix over GF2>, 
##        <an immutable 1x1 matrix over GF2> ], isMTXModule := true )
##  gap> TwoCoboundaries( G, M );
##  [  ]
##  gap> TwoCocycles( G, M );
##  [ [ Z(2)^0, 0*Z(2), 0*Z(2) ], [ 0*Z(2), Z(2)^0, 0*Z(2) ], 
##    [ 0*Z(2), 0*Z(2), Z(2)^0 ] ]
##  gap> cc := TwoCohomology( G, M );;
##  gap> cc.cohom;
##  <linear mapping by matrix, <vector space of dimension 3 over GF(
##  2)> -> ( GF(2)^3 )>
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "TwoCohomology", [ IsPcGroup, IsObject ] );

#############################################################################
##
#O  TwoCohomologyGeneric( <G>, <M> )
##
##  <#GAPDoc Label="TwoCohomologyGeneric">
##  <ManSection>
##  <Oper Name="TwoCohomologyGeneric" Arg='G, M'/>
##
##  <Description>
##  This function computes the second cohomology group for an arbitrary
##  finite group <A>G</A>. The generators of the module <A>M</A> must
##  correspond to the generators of <A>G</A>.
##  
##  It returns a record with components <C>coboundaries</C>,
##  <C>cocycles</C> and <C>cohomology</C> which are lists of vectors that form a
##  basis of the respective group. <C>cohomology</C> is chosen as a vector space
##  complement to <C>coboundaries</C> in the <C>cocycles</C>.
##  These vectors are representing tails in <A>M</A> with respect to the
##  <C>relators</C> of the presentation <C>presentation</C> of <A>G</A>.
##  (Note that this presentation is on a generating set chosen by the
##  routine, this generating system corresponds to the components
##  <C>group</C> and <C>module</C> of the record returned.
##  The extension corresponding to a cocyle <C>c</C> can be constructed as
##  <C>Extension(r,c)</C> where <C>r</C> is the cohomology record. This is
##  currently done as a finitely presented group.
##  <Example><![CDATA[
##  gap> g:=Group((1,2,3,4,5),(1,2,3));;
##  gap> mats:=[[[2,0,0,1],[1,2,1,0],[2,1,1,1],[2,1,1,0]],
##  > [[0,2,0,0],[1,2,1,0],[0,0,1,0],[0,0,0,1]]]*Z(3)^0;;
##  gap> mo:=GModuleByMats(mats,GF(3));;
##  gap> coh:=TwoCohomologyGeneric(g,mo);;
##  gap> coh.cocycles;
##  [ < immutable compressed vector length 44 over GF(3) >,
##    < immutable compressed vector length 44 over GF(3) >,
##    < immutable compressed vector length 44 over GF(3) >,
##    < immutable compressed vector length 44 over GF(3) >,
##    < immutable compressed vector length 44 over GF(3) >,
##    < immutable compressed vector length 44 over GF(3) >,
##    < immutable compressed vector length 44 over GF(3) >,
##    < immutable compressed vector length 44 over GF(3) > ]
##  gap> coh.coboundaries;
##  [ < immutable compressed vector length 44 over GF(3) >,
##    < immutable compressed vector length 44 over GF(3) >,
##    < immutable compressed vector length 44 over GF(3) >,
##    < immutable compressed vector length 44 over GF(3) >,
##    < immutable compressed vector length 44 over GF(3) >,
##    < immutable compressed vector length 44 over GF(3) >,
##    < immutable compressed vector length 44 over GF(3) > ]
##  gap> coh.cohomology;
##  [ < immutable compressed vector length 44 over GF(3) > ]
##  gap> g1:=FpGroupCocycle(coh,coh.zero,true);
##  <fp group of size 4860 on the generators [ F1, F2, F3, m1, m2, m3, m4 ]>
##  gap> g2:=FpGroupCocycle(coh,coh.cohomology[1],true);
##  <fp group of size 4860 on the generators [ F1, F2, F3, m1, m2, m3, m4 ]>
##  gap> g1:=Image(IsomorphismPermGroup(g1));
##  <permutation group with 7 generators>
##  gap> Length(ComplementClassesRepresentatives(g1,RadicalGroup(g1)));
##  3
##  gap> g2:=Image(IsomorphismPermGroup(g2));
##  <permutation group with 7 generators>
##  gap> Length(ComplementClassesRepresentatives(g2,RadicalGroup(g2)));
##  0
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "TwoCohomologyGeneric", [ IsGroup, IsObject ] );

#############################################################################
##
#O  FpGroupCocycle( <r>, <c>, <doperm> )
##
##  <#GAPDoc Label="FpGroupCocycle">
##  <ManSection>
##  <Func Name="FpGroupCocycle" Arg='r, c [,doperm]'/>
##
##  <Description>
##  For a record <A>r</A> as returned by
##  <Ref Oper="TwoCohomologyGeneric"/> and a vector <A>c</A> in the space of
##  two-cocycles, this operation returns a finitely presented group that is
##  an extension corresponding to the cocycle <A>c</A>. If the underlying
##  module has dimension <M>d</M>, the last <M>d</M> generators generate the
##  normal subgroup.
##  If the optional parameter <A>doperm</A> is given as <A>true</A>, a
##  faithful permutation representation is computed and stored in the
##  attribute <Ref Attr="IsomorphismPermGroup"/> of the computed group.
##  <Example><![CDATA[
##  gap> g:=Group((2,15,8,16)(3,17,14,21)(4,23,20,6)(5,9,22,11)(7,13,19,25),
##  > (2,12,7,17)(3,18,13,23)(4,24,19,9)(5,10,25,15)(6,11,16,21));;
##  gap> StructureDescription(g);
##  "GL(2,5)"
##  gap> mats:=[[[1,1,0,2],[2,0,0,0],[0,2,2,0],[0,1,0,0]],
##  > [[0,0,0,1],[1,1,2,0],[1,0,2,1],[1,0,1,0]]]*Z(3)^0;;
##  gap> mo:=GModuleByMats(mats,GF(3));;
##  gap> coh:=TwoCohomologyGeneric(g,mo);;
##  gap> coh.cohomology;
##  [ < immutable compressed vector length 116 over GF(3) > ]
##  gap> p:=FpGroupCocycle(coh,coh.zero,true);
##  <fp group of size 38880 on the generators
##  [ F1, F2, F3, F4, F5, F6, m1, m2, m3, m4 ]>
##  gap> g1:=Image(IsomorphismPermGroup(p));
##  <permutation group with 10 generators>
##  gap> p:=FpGroupCocycle(coh,coh.cohomology[1],true);
##  <fp group of size 38880 on the generators
##  [ F1, F2, F3, F4, F5, F6, m1, m2, m3, m4 ]>
##  gap> g2:=Image(IsomorphismPermGroup(p));
##  <permutation group with 10 generators>
##  gap> Collected(List(MaximalSubgroupClassReps(g1),Size));
##  [ [ 480, 3 ], [ 3888, 1 ], [ 6480, 1 ], [ 7776, 1 ], [ 19440, 1 ] ]
##  gap> Collected(List(MaximalSubgroupClassReps(g2),Size));
##  [ [ 3888, 1 ], [ 6480, 1 ], [ 7776, 1 ], [ 19440, 1 ] ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction("FpGroupCocycle");

#############################################################################
##
#O  CompatiblePairOrbitRepsGeneric( <compair>,<coh> )
##
##  <#GAPDoc Label="CompatiblePairOrbitRepsGeneric">
##  <ManSection>
##  <Func Name="CompatiblePairOrbitRepsGeneric" Arg='compair, coh'/>
##
##  <Description>
##  <Example><![CDATA[
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction("CompatiblePairOrbitRepsGeneric");



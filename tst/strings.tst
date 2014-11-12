#############################################################################
##
#W  strings.tst                GAP tests                  Alexander Konovalov
##
##  This file tests output methods (mainly for strings)
##
##  To be listed in testinstall.g
##
gap> START_TEST("strings.tst");

# FFE
gap> x:=Z(2);
Z(2)^0
gap> Display(x);
Z(2)^0
gap> ViewObj(x);Print("\n");
Z(2)^0
gap> PrintObj(x);Print("\n");
Z(2)^0
gap> DisplayString(x);
"Z(2)^0\n"
gap> ViewString(x);
"Z(2)^0"
gap> PrintString(x);
"Z(2)^0"
gap> String(x);
"Z(2)^0"

# String
gap> x:="abc";
"abc"
gap> Display(x);
abc
gap> ViewObj(x);Print("\n");
"abc"
gap> PrintObj(x);Print("\n");
"abc"
gap> DisplayString(x);
"abc\n"
gap> ViewString(x);
"\"abc\""
gap> PrintString(x);
"abc"
gap> String(x);
"abc"

# Empty string
gap> x:="";
""
gap> Display(x);

gap> ViewObj(x);Print("\n");
""
gap> PrintObj(x);Print("\n");
""
gap> DisplayString(x);
"\n"
gap> ViewString(x);
"\"\""
gap> PrintString(x);
""
gap> String(x);
""

# Empty list
gap> x:=[];
[  ]
gap> Display(x);
[  ]
gap> ViewObj(x);Print("\n");
[  ]
gap> PrintObj(x);Print("\n");
[  ]
gap> DisplayString(x);
"[  ]\n"
gap> ViewString(x);
"[  ]"
gap> PrintString(x);
"[ ]"
gap> String(x);
"[ ]"

# List
gap> x:=[1,2,3];
[ 1, 2, 3 ]
gap> Display(x);
[ 1, 2, 3 ]
gap> ViewObj(x);Print("\n");
[ 1, 2, 3 ]
gap> PrintObj(x);Print("\n");
[ 1, 2, 3 ]
gap> DisplayString(x);
"<object>\n"
gap> ViewString(x);
"[ 1,\<\> 2,\<\> 3 ]"
gap> PrintString(x);
"[ 1, 2, 3 ]"
gap> String(x);
"[ 1, 2, 3 ]"

# Character
gap> x:='a';
'a'
gap> Display(x);
'a'
gap> ViewObj(x);Print("\n");
'a'
gap> PrintObj(x);Print("\n");
'a'
gap> DisplayString(x);
"'a'\n"
gap> ViewString(x);
"'a'"
gap> PrintString(x);
"'a'"
gap> String(x);
"'a'"

# RemoveCharacters
gap> s := "I love pies pies pies";;
gap> RemoveCharacters(s, "ie");
gap> s;
"I lov ps ps ps"
gap> RemoveCharacters(s, "ie");
gap> s;
"I lov ps ps ps"
gap> RemoveCharacters(s, [' ']);
gap> s;
"Ilovpspsps"
gap> RemoveCharacters(s, []);
gap> s;
"Ilovpspsps"
gap> RemoveCharacters(s, "oooooppppp");
gap> s;
"Ilvsss"
gap> RemoveCharacters(s,s);
gap> s;
""
gap> RemoveCharacters(s,s);
gap> s;
""
gap> s := "I love pies pies pies";;
gap> RemoveCharacters(s, "");
gap> s;
"I love pies pies pies"
gap> RemoveCharacters(s, " ");
gap> s;
"Ilovepiespiespies"

# StringRep
gap> OldCopyToStringRep := function(s)
>    local tmp;
>    tmp := String(s);
>    ConvertToStringRep(tmp);
>    return(tmp);
> end;
function( s ) ... end
gap> s := List([1..2^16], x->CharInt(Random([63..126])));;
gap> IsStringRep(s);
false
gap> cp1 := OldCopyToStringRep(s);;
gap> IsStringRep(s);
false
gap> IsStringRep(cp1);
true
gap> cp2 := CopyToStringRep(s);;
gap> IsStringRep(s);
false
gap> IsStringRep(cp2);
true
gap> IsIdenticalObj(s, cp2);
false
gap> cp3 := CopyToStringRep(cp2);;
gap> IsStringRep(cp3);
true
gap> IsIdenticalObj(cp2, cp3);
false
gap> s = cp1;
true
gap> s = cp2;
true
gap> cp1 = cp2;
true
gap> cp2 = cp3;
true
gap> STOP_TEST( "strings.tst", 100000 );


module Fuzz.Opaque exposing (a, appendable, appendable2, b, c, comparable, comparable2, comparable3, comparable4, comparable5, d, e, f, g, h, i, j, k, l, m, n, number, number2, o, p, q, r, s, t, u, v, w, x, y, z, numberRange, numberRange2)

{-| Let's say you're testing a container, and you don't really care what you put into the list, as long as there are values, perhaps with a certain property. Why would you use a list of `int`s, when what you really want is a list of `a`, or a list of `comparable`?
-}

import Fuzz exposing (Fuzzer, bool, custom, float, floatRange, int, intRange, list, map, string, tuple, tuple3, tuple4, tuple5, unit)
import Random exposing (Generator)


constant c =
  map (always c) unit



-- Comparables. Note that they are all different types.


comparable : Fuzzer ( String, Int )
comparable =
  tuple ( constant "comparable", int )


comparable2 : Fuzzer ( String, Int, String )
comparable2 =
  tuple3 ( constant "comparable2", int, constant "\x1F914" )


comparable3 : Fuzzer ( String, Int, Char )
comparable3 =
  tuple3 ( constant "comparable3", int, constant '\x1F917' )


comparable4 : Fuzzer ( String, Int, Float )
comparable4 =
  tuple3 ( constant "comparable4", int, constant pi )


comparable5 : Fuzzer ( String, Int, Char, Char )
comparable5 =
  tuple4 ( constant "comparable5", int, constant '❤', constant '\x1F937' )



-- Appendables. Unfortunately, there are only two, but it's better than nothing.


appendable : Fuzzer String
appendable =
  string


appendable2 : Fuzzer (List Opaque)
appendable2 =
  list opaque


type Opaque
  = Opaque Int


opaque =
  map Opaque int



-- Numbers. Unfortunately, there are only two, but it's better than nothing.


number : Fuzzer Float
number =
  float


number2 : Fuzzer Int
number2 =
  int


numberRange : number -> number -> Fuzzer Float
numberRange low high =
  floatRange (numToFloat low) (numToFloat high)


numberRange2 : number -> number -> Fuzzer Int
numberRange2 low high =
  intRange (floor (numToFloat low)) (ceiling (numToFloat high))


numToFloat : number -> Float
numToFloat n =
  case toString n |> String.toFloat of
    Err _ ->
      Debug.crash "toString and String.toFloat don't agree"

    Ok f ->
      f



-- Opaque type fuzzers; arbitrary types with no constraints. Note that they are all different types.


type A
  = A Int


a : Fuzzer A
a =
  map A int


type B
  = B Int


b : Fuzzer B
b =
  map B int


type C
  = C Int


c : Fuzzer C
c =
  map C int


type D
  = D Int


d : Fuzzer D
d =
  map D int


type E
  = E Int


e : Fuzzer E
e =
  map E int


type F
  = F Int


f : Fuzzer F
f =
  map F int


type G
  = G Int


g : Fuzzer G
g =
  map G int


type H
  = H Int


h : Fuzzer H
h =
  map H int


type I
  = I Int


i : Fuzzer I
i =
  map I int


type J
  = J Int


j : Fuzzer J
j =
  map J int


type K
  = K Int


k : Fuzzer K
k =
  map K int


type L
  = L Int


l : Fuzzer L
l =
  map L int


type M
  = M Int


m : Fuzzer M
m =
  map M int


type N
  = N Int


n : Fuzzer N
n =
  map N int


type O
  = O Int


o : Fuzzer O
o =
  map O int


type P
  = P Int


p : Fuzzer P
p =
  map P int


type Q
  = Q Int


q : Fuzzer Q
q =
  map Q int


type R
  = R Int


r : Fuzzer R
r =
  map R int


type S
  = S Int


s : Fuzzer S
s =
  map S int


type T
  = T Int


t : Fuzzer T
t =
  map T int


type U
  = U Int


u : Fuzzer U
u =
  map U int


type V
  = V Int


v : Fuzzer V
v =
  map V int


type W
  = W Int


w : Fuzzer W
w =
  map W int


type X
  = X Int


x : Fuzzer X
x =
  map X int


type Y
  = Y Int


y : Fuzzer Y
y =
  map Y int


type Z
  = Z Int


z : Fuzzer Z
z =
  map Z int

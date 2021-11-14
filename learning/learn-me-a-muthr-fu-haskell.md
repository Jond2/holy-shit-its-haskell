#### Learn You A Haskell For Great Good

**Allow me to introduce myself.**

*Well, I'll likely keep this ~~anon~~ (fuck it) ~~unless I publish it on GitHub~~. I always considered myself fairly competent, until I ran into the rigour and attention to detail that the Haskell community heavily encourage. I had a decent'-ish' schooling experience. Any missed opportunities were mainly my own fault. I finished my undergraduate degree at the university of Manchester, graduating with a first class honours degree. I spent two to three years as a web developer; and then attempted an MSc at the University of Edinburgh, for which I just need to write a thesis to finish.*

**Haskell**

*Why? Well, I really enjoy the Cardano community, their project, what it is we're looking to try and do, together, collectively; it's inspiring. They selected one of the most appropriate tools for writing Smart Contracts; and well, I figured: let's give it a shot.*

**Learning**

*I found it very difficult to pick up Haskell 'on the go', I had to take a step back and reconsider my goals and ultimately, my timeline. I've since ran through an introductory course taught by Prof Phil Wadler out of the University of Edinburgh. There are still SOME things I need to brush up on, likely because I was not doing the additional reading and was, obviously, not present for any labs. I did, however, find that this has given me a good grounding to move through some of the written materials a little faster. So...*

**Let's do this.**

*Let's move through Learn You A Haskell For Great Good, in a week or less, which should be more than do-able, right? FYI: I'm not super-genius. After that, I have a number of other books I would like to try and work through. Again, why? I believe learning to think functionally and write programs as such will make you a better engineer. Simple. So why waste time, let's do it.*

* *Headphones on.*
* *Leeeerooooyyy. Hang on...*
* *"Let's get busy"?*

#### Contents, In Not So Much Detail

* Intro
* Starting Out
* Believe the TYPE
* Syntax In Functions
* Hello Recursion
* Higher-Order Functions
* Modules
* Making Our Own Types And Type Classes
* Input And Output
* (More) Input And Output
* Functionally Solving Problems
* Applicative Functors
* Monoids
* A Fistful Of Monads
* For A Few Monads More
* Zippers
* Index

#### Introduction

* Stuck? Freenode IRC #Haskell
* Haskell === Purely Functional (Referential Transparency is Maintained)
* It sounds to me like: instead of instantiating undefined processes, you declare and define them before use.
* You don't 'tell' the computer WHAT TO DO, you tell the computer: what is.
* Immutable, although you can actually create a new 'constant' with the same name and the most recent declared constant is what is referenced in main, garbage collection will do the rest.
* No side effects.
* Gluing simple functions together to create more complex functions is the name of the game.
* Provable for correctness and maintains referential transparency (as outlined above).
* Haskell is one lazy mother fucker. Not asking for a result? Well, you don't ask, you don't get; further, you don't ask? Haskell doesn't bother executing, because unlike what L'Oreal might tell you. No. You're not worth it.
* Haskell is like... Well, I likely do too much work, it's overkill (and I'm fucking stupid, so it doesn't sink in half the time); but you know, there are those people who do the bare minimum (usually the more clever among us), well, Haskell is one of those dudes (or dude-ettes).

```haskell
-- example doubleMe function: from the fucking book mother fucker.
Prelude> :{
Prelude| doubleMe :: Num a => a -> a
Prelude| doubleMe a = a * 2
Prelude| :}
Prelude> doubleMe 12
24
Prelude> doubleMe 12.5
25.0
Prelude> doubleMe(doubleMe(doubleMe(8)))
64
Prelude> doubleMe(doubleMe(doubleMe(8.86237861723)))
70.89902893784
Prelude> -- want a string mother fucker?
Prelude> show (doubleMe(doubleMe(doubleMe(8.86237861723))))
"70.89902893784"
```

* I'm stupid. I cannot fucking read. What am I, some kind of idiot? Yes.
* xs is typically what you use when you're denoting a list (and (x:xs) for head, tail, we'll get to that later mate)
* So we're actually talking about fucking lists. Jesus, I have been awake too long.
* Right, so I get evil languages will just generate a bunch of copies of the list and parse it multiple times, AFAIK Haskell will only do this when it really needs to. But from what I can tell, even though the result from something like ```doubleMe(doubleMe(xs))``` is only executed when it needs to be, it doesn't change the list ```xs``` at the memory location its stored it, rather it just redeclares a new *constant(?? someone fucking correct me)* and immediately passes that to doubleMe, and does the same to the outer doubleMe, correct, or incorrect? The result has to be somewhere in memory, so how is this better than creating copies that are then scooped up by garbage collection?

<hr />

**Haskell, yeah, is STATICALLY TYPED MOTHER FUCKER. Although, it may not seem so... GHC is pretty fucking clever.**

* Reason why you can declare things like ```myFunctionWithoutAFuckingDec n = n * n``` is due to Haskells Type Inference system, so whilst it is statically typed at compile time, you can write it with a degree of 'looseness'. Although this is frowned upon (kinda).
* Best practice: myFunc :: Num a => a, or myFunc :: Int -> Int, or Double or Float, or whatever you feel best suits your clients suitcase. I mean use case.

# OH MY LORD. I AM SLOW AT PARSING ACADEMIC MATERIALS. SOMEONE GET ME A DUNCE HAT.

* In short, add a function declaration, or die.
* Also, Haskell is cleverer than you, so unless you fucking need to, don't prematurely or micro optimise your code. We've got CLEVER PEOPLE FOR THAT, they create, well the compiler and libraries.
* This book is telling me Haskell is elegant and concise. I mean, I'm going to go ahead and add 'eloquent' to that list.

```haskell
Prelude> haskell = ["elegant", "concise", "eloquent, mother fucker."]
```

Lastly, for the intro, libraries are your friends; because you don't have any others.

<hr />

*Inspired by: [http://motherfuckingwebsite.com/](http://motherfuckingwebsite.com/) and [https://bettermotherfuckingwebsite.com/](https://bettermotherfuckingwebsite.com/)*

### Holy Shit, Chapter One

*Starting Out, AGAIN.*

* Nope I'm not a horrible person who doesn't read documentation.
* Okay, so some GHCi, OKAY.
* Some, you know, basic math before, BAM MONADS. Just kidding, they come later.
* BTW. Monads are actually "Warm Fuzzy Things"
* Use parentheses mother fucker.
* Okay, so Haskell does have an order of precedence, but they did seem to purposely not use ```(``` and ```)``` as part of any function definition. For example, you can implicitly define a function: ```f n = n * n```; dw, the compiler will get ya, but you have composite functions, it doesn't really know which one to evaluate first. Esp, since you can define domain specific languages, which I'm sure we'll talk about later, where you can essentially define your own rules regarding precedence (from what I understand).
* We've got some information here on Propositional Logic, my favourite!
	* True
	* False 
	* Not
	* &&
	* ||
* Some more type inference and equality operators: ```5 /= 5 -- evals to False```
* Strings are lists of characters (remember C?), only this time, no fucking pointers, but there is a whole bunch of other confusing shit, so prepare yourself.
* You can't add stupid shit together, fool.

```haskell
Prelude Data.Char> "hello" + "world!"

<interactive>:76:1: error:
    • No instance for (Num [Char]) arising from a use of ‘+’
    • In the expression: "hello" + "world!"
      In an equation for ‘it’: it = "hello" + "world!"
Prelude Data.Char> -- OH NOES, WHATS WRONG!? Well, technically two lists, moron.
Prelude Data.Char> "hello" ++ "world!"
"helloworld!"
Prelude Data.Char> "hello" + 55

<interactive>:79:1: error:
    • No instance for (Num [Char]) arising from a use of ‘+’
    • In the expression: "hello" + 55
      In an equation for ‘it’: it = "hello" + 55
Prelude Data.Char> -- that's right, you're an idiot.
```

### OH LORD A NOTE, I LOVE NOTES.

* 5 + 4.0 IS A VALID EXPRESSION. I WONDER WHY!? -- Hmm, is Num a => ... Monadic? I think it's just a type class, or a Data Constructor. Again, we'll talk about those later.
* Basically, I can be like, yo:

```haskell
Prelude Data.Char> :{
Prelude Data.Char| o :: Num p => p -> p
Prelude Data.Char| o p = p^2
Prelude Data.Char| :}
Prelude Data.Char> o 120
14400
```

* Forget everything you thought you knew about variable names. The smaller the better (ask your girlfriend, Ermmm, I hope she's a Haskell programmer). -- that was not from the book, but yeah, they should typically be descriptive, right? However, descriptive in the smallest number of characters possible; and if you can use a convention, fucking do it. (x:xs) for lists as formal parameters, functions are camel case (if you get to use that many characters), then Data and Type Constructors use fucking capital letters; but yeah, you probably have no idea what I'm talking about if you don't know any Haskell. So, let's get fucking going bro. Man, I hate that word "bro", someone shoot me.
* I may not have realised it, but I've been using functions? Not too sure about this statement. This book has underestimated my initial learning approach (do a quick course before reading all these books).
* Okay some info on prefix and infix operators. These are my notes, I do what I like.
* params are spaces. Yep.
* **function application has highest precedence**

```haskell
succ 9 + max 5 4 + 1
16
(succ 9) + (max 5 4) + 1
16
succ 9 * 10
100
succ (9 * 10)
91
div 92 10
9
-- why the fuck arn't we writing this in a much nicer fashion!?
92 `div` 10
9
-- that's right, time for some GIN AND JUICE.
```

#### Jesus Christ, I Better Get A Move On, These Chapters Are LONG.

*Time for some .hs files! Hmm, should I reach for cabal just yet? Nah..*

Here we go, just sorta messing with the examples in the book...

*baby.hs*

```haskell
doubleUs x y = x * 2 + y * 2
doubleMe x = x + x
doubleUs' x y = doubleMe x + doubleMe y
doubleSmallNumber x = if x > 100
                        then x
                        else x * 2
doubleSmallNumber' x = (if x > 100 then x else x *2) + 1
allNumbers (x:xs) = [ q | q <- xs, q > 100] ++ [ y * 2 | y <- xs, y <= 100]
```

*ghci*

```haskell
Prelude> :l src/baby.hs
[1 of 1] Compiling Main             ( src/baby.hs, interpreted )
Ok, one module loaded.
*Main> doubleUs 10 20
60
*Main> doubleUs 10 20.2
60.4
*Main> doubleUs' 10 20
60
*Main> doubleUs' 10 20.2
60.4
*Main> doubleUs == doubleUs'

<interactive>:6:1: error:
    • No instance for (Eq (Integer -> Integer -> Integer))
        arising from a use of ‘==’
        (maybe you haven't applied a function to enough arguments?)
    • In the expression: doubleUs == doubleUs'
      In an equation for ‘it’: it = doubleUs == doubleUs'
*Main> -- need quick check for this.
*Main> doubleSmallNumber 47
94
*Main> doubleSmallNumber 99
198
*Main> doubleSmallNumber 100
200
*Main> doubleSmallNumber 101
101
*Main> doubleSmallNumber 102
102
*Main> allNumbers [1,7,47,42,42,42,42,42,1000008]
[1000008,14,94,84,84,84,84,84]
*Main> foldl (+) 0 (allNumbers [1,7,47,42,42,42,42,42,1000008])
1000536
*Main> -- time for a coffee' !? Nah, lets keep on keepin on!
```

* some info on cat (++)
* some info on cons (:)
* Lists, Lists of Lists and Lists of Many Lists (Monadic?)
* !!
* My head gets a bit confuzzled when lists inside lists, usually when there are strings in lists, basically: how to map functions to individual characters within strings which are in lists.
* Lists have to all contain the same type. But you can have tuples and shit yeah, which can have differing types, so a list of tuples could be pretty damn useful.
* Lists are comparable (probably implement deriving (eq, ... etc).

### COMPARING BLOODY LISTS! Good to know:

Right, so Haskell (yeah, it's weird right?); it's going to compare the head of... hang on, I mean the first elem (meaning element) of the a list to another list, if for instance you're using an operator like > ... then if say the first two elems are equal, it'll move to the next elem in the list. See the example:

```haskell
*Main> [3,4,2] < [3,4,3]
True
*Main> [3,2,1] > [2,1,0]
True
*Main> [3,2,1] > [2,10,10000000]
True
*Main> -- WHY THE FUCK? Well, it's because 3 > 2, simple as.
*Main> [3,4,2] == [3,4,2]
True
*Main> [3,4,2] == [3,2,4]
False
*Main> -- so, obviously ordering matters here, unless you say.. define your own.. let's not get ahead of ourselves.
```

#### Heads? or Tails? TAILS FOR WALES, NEVER FAILS

*Except in about 90% of instances, scientifically proven.*

So, you like head functions? I heard. Haskell has you covered. I hope you like tails too..? Bit weird like, but head is a function which takes the 'head' (the first elem, a literal, not contained within a list) of a list; and tail returns everything except the head. Imagine you're fighting a massive super snake; and it's one hard ass mo'fo. Think of the head, as well, it's head (that you're trying to chop off), and the tail is the rest of that monster. So, when you call head, you are returned the first elem. Tail returns everything but. Think I just REPEATED MYSELF. DRY. DRY. DRY. DRY. If I repeat DRY enough times, it'll sink in.

* we got some other cool shit too:
* head [] -- raises an exception, surprise surprise.
* length, you guessed it.
* null tests for the empty list: null [] -- True, null [1,2,3] -- False
* reverse
* almost forgot (since I don't often use them): init and last. init is everything but last; and last, is well the last elem.
* take is going to TAKE elems from index 0 -> (param - 1); take n ... take elem from 0 to n - 1
* what about take 1? take 0 -> 0, single elem, same as head
* take 0, you would perhaps think it would take the last item, but wrong, just takes the empty list.
* take n, where n > length [a..b] returns [a..b]


*I'm going to take just a tad bit of a break, I know this must look, mental. I've been through Haskell like, well once during my undergrad, but that was years ago and I never really understood it. Visited it again during my PG, but didn't give it much time. Have given it quite a lot of time in the last four months. Now I'm going through it AGAIN. Basically, just reading all the books I have on it. I'm sorry, but it's difficult for me; I'm a bit of a dunce and I don't care, I'll get there. It may take some time, but I'll get there. I want to learn a functional language, why not Haskell? Hopefully (since I can write Java and most other languages, including ARM btw, which I'm quite happy about, I prefer ARM Assembly over fucking C mate, seriously) I will be able to jump into Scala, etc. Just taking some time (whilst I can) to learn as much as I can, at my own pace now; because it's just not possible to keep up will everyone who already has this stuff down to a T.*

*See you on the other side.*
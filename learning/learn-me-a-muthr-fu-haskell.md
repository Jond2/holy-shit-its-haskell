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


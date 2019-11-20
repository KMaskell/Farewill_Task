## Program notes
- Linted with Rubocop
- To run RSpec test framework, run the following command from root file in terminal: rspec
- Can be tested from IRB: 
  * run irb from lib file in terminal: irb
  * require main file: require './specific_gifts.rb'
  * call function with parameters e.g.: specific_gifts(1, [
    {
      name: 'Crocs',
      beneficiaries: [
        {
          name: 'Daniel Garrett',
          identifier: 'dan@farewill.com'
        }
      ]
    }
  ])
    
      
## Farewill code task: Construct the 'specific gifts' section of a will  
This is a code task for applicants for the Junior Software Engineer role at Farewill. It's based on a real part of our codebase, and is intended to help us get an idea of how comfortable you are with coding.

This task is to be completed in your own time, but please don't spend more than 3 hours on it! An incomplete version is okay.

We're looking to see how you approach the work as much as the end product. As well as the code you write, we also want to understand why you've chosen your solution, or what you'd do if you had more time. There are questions at the bottom of this readme that we'd love your thoughts on when you submit your answers.

## 👋 Intro  
The 'specific gifts' part of a Farewill will (where you can specify who should recieve things like watches, bikes, rings, etc.) consists of three legal clauses.

The first two are standard clauses which are the same for every will that includes 'specific gifts'. The third contains an itemised list of all gifts included in the will, and who they should be left to.

Like any clause in a will, each of the three clauses is numbered in ascending order.

**An example of the end output of the 'specific gifts' section:**  

```12  The specific gifts given by this Will shall be paid free of
    inheritance tax and other taxes or duties payable as a result
    of my death and the cost of delivering any gift to a beneficiary
    or vesting it in them shall be an executorship expense as shall
    be the cost of the upkeep of the gift until delivery or vesting.

13  Any item that fails to pass to a beneficiary will return to my
    estate to be included in the residue of my estate.

14  I give to Helena Thompson of helena@farewill.com my 'Laptop'. I
    give to Daniel Garrett of dan@farewill.com and Holly Furniss of
    holly@farewill.com my 'Crocs'. I give to Zac Colley of
    zac@farewill.com my 'Jewellery'.
```

**❓ What you have to do**  

You'll need to write a function that:

* takes two arguments; the first is an index (startIndex) and the second is an array of gifts (giftsArray)
* returns an array representing the will output for this section. The array will consist of array pairs of numbers and strings for each clause, for example:

```[
  [12, "The specific gifts given [...etc]"],
  [13, "Any item that fails to pass [...etc]"],
  [14, "I give to Helena [...etc]"],
]
```

**The startIndex**  
The clauses are numbered in ascending order, and this function needs to be able to handle starting that numbering from a given index.

startIndex should be the number of the first clause in the array. For example, if startIndex is given as 7 then the value returned from your function might look like:

```[
  [7, "The specific gifts given [...etc]"],
  [8, "Any item that fails to pass [...etc]"],
  [9, "I give to Tom [...etc]"],
]
```

**The clauses**  
The function will always return three clauses: the two standard clauses (see above, in the Intro section), and one specific gifts clause.

Each item in giftsArray argument will have a name string and a beneficiaries array. Each item in the beneficiaries array will have a name string and identifier string, for example:

```const giftsArray = [
  {
    name: "Laptop",
    beneficiaries: [
      {
        name: "Helena Thompson",
        identifier: "helena@farewill.com"
      }
    ]
  },
  {
    name: "Crocs",
    beneficiaries: [
      {
        name: "Daniel Garrett",
        identifier: "dan@farewill.com"
      },
      {
        name: "holly furniss",
        identifier: "holly@farewill.com"
      }
    ]
  }
];
```

To generate the third clause, you'll need to turn giftsArray into a string in the right format: "I give to NAME of IDENTIFIER my 'GIFT NAME'."

Make sure that the first letter of each name is capitalised, and if there are multiple beneficiaries then separate each one with "and" (no commas!)

For the giftsArray example above, the third clause would be:

I give to Helena Thompson of helena@farewill.com my 'Laptop'. I give to Daniel Garrett of dan@farewill.com and Holly Furniss of holly@farewill.com my 'Crocs'.

**💻 To get started**  
**If you're using JavaScript**  
1. 'Remix' this application. This will create a copy of all this code for yourself with a unique URL.
2. Work on your code until you're happy
    * The function for you to complete is in the js/main.js file.
    * Use the tests in js/main.test.js as requirements.
    * Click "Tools" in the left sidebar, then "Logs". This will show you test output as you work on your code.
3. When you've finished, copy your unique Glitch URL.
4. Email us that link with your notes on your thoughts and reasoning behind the decisions you made.

*If you don't want to use Glitch, just follow the "If you're using another programming language" steps below instead!*

**If you're using another programming language**  
1. Work on your code until you're happy
    * The tests in js/main.test.js help to clarify the requirements.
    * You don't have to write tests, but you're welcome to do so.
2. When you've finished, upload your code as a secret gist
3. Include clear instructions on how to run your code.
4. Email us the link to your gist, with your notes on your thoughts and reasoning behind the decisions you made.

**Things you may wish to cover in your notes:**  
* What went well?  
* What could have gone better?  
* Is there anything particular you'd like to come back and improve if you had time? Why?  

I used Ruby to complete this challenge because this is the primary language taught at Makers Academy the past few months, and therefore my current strength. If I had more time I'd love to tackle this challenge in JavaScript to hone my JS skills. Infact, I think I'll do this next to hone my JS and keep my Github green!

I used string interpolation for clause 3. This felt like the best way to return the string with variable beneficiary and gift values.
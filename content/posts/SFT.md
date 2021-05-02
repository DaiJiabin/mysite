---
title: "Software Fault Tolerance"
date: 2021-05-02T15:50:34+02:00
draft: false
tags: [Kurse]
categories: [TUD]
featuredImagePreview: "/TUD.png"
---

## 03. [Fuzzing](https://en.wikipedia.org/wiki/Fuzzing)

### Definition

- A way to discover bugs in software by providing __randomised inputs__ to programs to find test cases that cause a crash

### Goal

- Find crashes
- Find abnormal behavior
- Find security vulnerabilities

### Testing variants

#### Positive testing

- Test __features__

#### Negative testing

- Test if the system does things it is not supposed to do
- __Fuzzing belongs to negative testing__

### Fuzzing vs. Random testing

- Random testing is a simple version of fuzzing
- Problem of random testing: __Coverage__ increases slowly
- Fuzzing: try to generate test cases in a smarter, more efficient way

### Components

#### 1. Generator

##### 1.1 Tasks

- Testing inputs to drive SUT
- Different approaches on how to generate the input

##### 1.2 Types

###### Mutative generator

- \+ Start with a sample input
- \+ Mutate a part of it
- \+ Good for highly structured inputs
- \- Less Intelligence
- \- Less human effort to understand protocols & interfaces

###### Generative generator

- Generate the test cases from scratch
- Higher level of coverage
- More effort, if based on templates or grammars

##### 1.3 Different production approach

###### Oblivious fuzzer

- Randomly mutate/generate data
- Similar to random testing

###### Template based

- Provide an __input template__
- __Modify/generate only those parts that are allowed by the template__
- Simple interface: __minimal understanding of the structure accepted by SUT__

###### Block based

- Data represented as __nested data blocks of varying types__ as opposed to __string sequences(template based)__

###### Grammer based

- Covers some part of input language
- __Heuristic based__
- Better than complete ramdom(?)

###### Protocol fuzzers

- Protocol description, not only grammar

#### 2. Delivery machanism

- Presents the output of the fuzz generator as input to the SUT
- i.e., file, mouse, etc.

#### 3. Monitoring system

- Observing the SUT and detection of errors that arise as input is presented

###
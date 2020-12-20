---
title: "Machine Learning"
date: 2020-12-18T19:11:53+01:00
draft: false
tags: [AI]
categories: [Learn]
featuredImagePreview: "/Machine-Learning.jpg"
---

![Machine-Learning](/Machine-Learning.jpg)

# Lecture by [Andrew Ng, Coursera](https://www.coursera.org/learn/machine-learning)

## Week 1 Basic Concepts & Linear Regression 

### Supervised Learning vs. Unsupervised Learning

- Supervised Learning: 

  > In supervised learning, we are given a data set and already know what our correct output should look like, having the idea that there is a relationship between the input and the output.
  
  - Training Data already has the value, which our Function should predict for a new, strange input. i.e, In the case below, we want to get a function, so that we can calculate the price of a house to be sold. We have __4 Training Data__ in this table and each Data has 4 __Features__ that have a influence on its' price ( we call it as __Multi-Features__. It'll be discussed later:) ).

  - It's devided in __Regression__ and __Classification__ Problems
  

||Size|Number of Bedrooms|Number of Floors|Age(years)|Price(1000$)|
|:---:|:---------:|:----------------:|:--------------:|:--------:|:---:|
|$TrainingData_1$|2104|5|1|45|460|
|$TrainingData_2$|1416|3|2|40|232|
|$TrainingData_3$|1534|3|2|30|315|
|$TrainingData_4$|852|2|1|36|178|
|...|...|...|...|...|...|
||($x_1$)|($x_2$)|($x_3$)|($x_4$)|($x_5$)|

- Unsupervised Learning 
  
  > Unsupervised learning, on the other hand, allows us to approach problems with little or no idea what our results should look like. We can derive structure from data where we don't necessarily know the effect of the variables.

### Regression vs. Classification

- Regression: The Value we want to predict is __continious__ instead of discrete. i.g., the Price of a House.

    > In a regression problem, we are trying to predict results within a continuous output, meaning that we are trying to map input variables to some continuous function. 

- Classification: As its' name, we want to __devide the input in different classes__. i.g., After training, with the help of the <u>color, weight, outlook and smel</u> ( __Features__ ), we want to predict if the coffee beans we have come from Arabica or Robusta.

    > In a classification problem, we are instead trying to predict results in a discrete output. In other words, we are trying to map input variables into discrete categories.

### Linear Regression with 1 Variable / Feature

- Hypothesis Function

  - $\hat y = h_\theta = \theta_0 + \theta_1x$

- Cost Function

  - $J(\theta_0, \theta_1) = \frac{1}{2m} \sum_{i=1}^m(\hat y_i - y_i)^2$
    
    $\rarr J(\theta_0, \theta_1) = \frac{1}{2m} \sum_{i=1}^m(h_\theta(x_i) - y_i)^2$

- Optimize

  - __Gradient Descent.__ More specifically, repeat:
  
    $tmp_0 = \theta_0 - \alpha\frac{\partial}{\theta_0}{J(\theta_0, \theta_1)}$
    
    $\rarr tmp_0 = \theta_0 - \alpha\frac{1}{m}\sum_{i=1}^m{(h_\theta(x_i) - y_i)}$
    
    $tmp_1 = \theta_1 - \alpha\frac{\partial}{\theta_1}{J(\theta_0, \theta_1)}$
    
    $\rarr tmp_1 = \theta_1 - \alpha\frac{1}{m}\sum_{i=1}^m{((h_\theta(x_i) - y_i)x_1)}$
    
    $\theta_0 = tmp_0$
    
    $\theta_1 = tmp_1$

    We call $\alpha$ __Learning Rate.__ Its' value has influence on the speed, how fast we can find the parameters, with that we can reach a local optimal value.

  - __When $\alpha$ too large / too small is:__

    - too large: we might miss the parameters, which can help us get the local optimal value.

    - too small: We need more iterations ( Baby Steps / more time ).

    - We can make the judge, whether $\alpha$ too large / small ist by drawing the plot of __iterations - $J(\theta_0, \theta_1)$:__ It should be lower. Otherwise is $\alpha$ too large.
    - We can start $\alpha$ from __0.001, ..., 0.01, ..., 0.1.__ And Andrew Ng advises us to use 3 times ( 0.001, 0.003, 0.01, 0.03, 0.1 ) to try it.

### Multiple Features and Matrix

- Vector:

  - A vector is a Matrix with __one Column and many rows.__ i.g., $\begin{bmatrix}x_0 \\\\ x_1 \\\\x_2 \\\\x_3 \end{bmatrix}$

- Hypothesis:

  - We use the table above as example, we have 4 Training Data and each of them has 4 Features. According to this, we should have 4+1 parameters $\theta_0-\theta_4$. We write the Hypothesis below:
  
    $h_\theta(x^i) = \theta_0 + \sum_{j=1}^4\theta_jx_j^i$
  
    $x_i^j$ here means the _jth Feature_ of the _ith Training Data._

    Actually we can add a Feature $x_0 \equiv 1$, then we can use the Matrix. So that we can write the Equation above as below:
  
    $h_\theta(x^i) = \sum_{j=0}^4\theta_jx_j^i$

    We let:
    
    $\Theta = \begin{bmatrix}\theta_0, \theta_1, \theta_2, \theta_3, \theta_4\end{bmatrix}$, 
    
    $X = \begin{bmatrix}  x^1_0 & x^2_0 & x^3_0 & x^4_0 \\\\ x^1_1 & x^2_1 & x^3_1 & x^4_1 \\\\ x^1_2 & x^2_2 & x^3_2 & x^4_2 \\\\ x^1_3 & x^2_3 & x^3_3 & x^4_3 \\\\ x^1_4 & x^2_4 & x^3_4 & x^4_4 \end{bmatrix}$. 
    
    So that $h_\theta(x^i) = \Theta * i_{th}$ column of $X$. In Matrix $X$, element $x_0^i \equiv 1$. We can also calculate $\Theta * X$ directly, the $i_{th}$ colum is the value of $h_\theta(x^i)$.

- Cost Function:
  
  - Assume we have __m Training Data__, each of them has __n Features__.
  
    $J(\theta_0, \theta_1, ... \theta_n) = \frac{1}{2m}\sum_{i=1}^m(h_\theta(x^i) - y^i)^2$

- Gradien Descent:

  - repeat:
  
    $tmp_i = \theta_i - \alpha\frac{\partial}{\partial\theta_i}J(\theta_0, \theta_1, ..., \theta_n)$ 
    
    $\rarr tmp_i = \theta_i - \alpha\frac{1}{m}\sum_{i=1}^m(h_\theta(x^i) - y^i)* x^i)$

    $\theta_i = tmp_i$

### Feature Scaling

- We use this technique __when the range of Features have great Difference.__ i.g., $0 \leq x_1 \leq 2000, 0 \leq x_2 \leq 5$, then we can $x_1 \coloneqq \frac{x_1}{2000}, x_2 \coloneqq \frac{x_2}{5}.$ This helps with the speed up of the Gradient Descent.

- Andrew Ng advices that scaling all Features __approximately__ into the range __[-1, 1]__.

- We can also scale the Features by using this:
  
  $x_i = \frac{x_i - \mu_i}{s_i}$

  Here $\mu_i$ is the average value of Feature $x_i$, $s_i$ is normally $value_{max} - value_{min}$. 

### Normal Equation

- The Method to solve for $\Theta$ analytically:
  
  $\Theta = (X^TX)^{-1}X^TY$ can minimize the $J(\theta)$.

  $x^i = \begin{bmatrix}x_0^i, x_1^i, ..., x_n^i\end{bmatrix}$

  $X = \begin{bmatrix} x_0^1 & x_1^1 & {...} & x_n^1 \\\\ x_0^2 & x_1^2 & {...} & x_n^2 \\\\ ... & ... & ... & ... \\\\x_0^m & x_1^m & {...} & x_n^m \end{bmatrix}$

  In this Matrix, we write __each row the Features of one Training Data__.

- The following table can helps us decide, when to use __Normal Equation__, when to use __Gradient Descent__.

  |Normal Equation|Gradient Descent|
  |:-------------:|:--------------:|
  |No need to choose $\alpha$.|May have "Baby Step" issue, or miss the local optimal value when $\alpha$ too large.|
  |Can be slow when __n ( Number of Features )__ too large is.|Works fine even when n large is.|
  |Some Matrix is __singular or degenerated.__||
  |$n \leq 10,000$|$n > 10,000$|

- Reasons of uninvertibility of Matrix $(X^TX)^{-1}$:
  
  - Redundant Elements: linear depent.
  
    i.g., $x_1 = $size in $feet^2$, $x_2$ = size in $m^2$.
  
- Too many Features: Just delete some of them, or use __regulization ( discuss later ).__

## Week 2 Logistic Regression

### Logistic Regression - Classification

  - Examples: Email (Spam / Not Spam), Online Transactions: Fraudulent ( Yes / No ) ?
  
  - $y \isin {0, 1} \begin{cases} 0 &\text{Negative Class} \\\\ 1 &\text{Positive Class} \end{cases}$

  - p.s. In __multi-class__ Prolems this set can have more than 2 elements.

- What if we use linear Regression in a classfication problem?
  
  - $h_\theta(x) = \theta^Tx< 0$ or $> 1$

- In __Logistic Regression__, it shouled always be: __$0 \leq h_\theta(x) \leq 1$__. So we do the following transformation, then we get the __Hypothesis__:

  - $h_\theta(x) = g(\theta^Tx)$

  - Then we use __Sigmoid Function / Logistic Function:__ 

    - $g(z) = \frac{1}{1 + e^{-z}}$
    
    ![Sigmoid](/Sigmoid.png)

  - We have now:
    
    - $h_\theta(x) = \frac{1}{1 + e ^ {-\theta^Tx}}$

  - This Function $h_\theta(x)$ comes out the result that estimated probability that $y = 1$ on input x. We can also write it in the following Form:
    
    $h_\theta(x) = P(y = 1 | x; \theta)$ $\rarr$ Probability that $y = 1$, given $x$, parameterized by $\theta$.

  - $P(y = 1 | x; \theta) + P(y = 0 | x; \theta) = 1$

### Deciding Boundary 
  
- Linear

  ![Linear](/Linear.png)

- Non-Linear

  ![Non-Linear](/Non-Linear.png)

### Cost Function

- Training Set: ${(x^{(1)}, y^{(1)}), (x^{(2)}, y^{(2)}), ..., (x^{(m)}, y^{(m)})}$, __m examples__

- x $\isin \begin{bmatrix}x_0 \\\\ x_1 \\\\ ... \\\\ x_m\end{bmatrix}, x_0 \equiv 1, y \isin (0, 1)$

- $h_\theta(x) = \frac{1}{1 + e ^ {-\theta^Tx}}$

  > Brief Review: Cost Function in __Linear Regression:__  
    $J(\theta) = \frac{1}{m}\sum_{i=1}^m\frac{1}{2}(h_\theta(x^{(i)} - y^{(i)})^2$  
    $Cost(h_\theta(x), y) = \frac{1}{2}(h_\theta(x) - y)^2$

- $Cost(h_\theta(x), y) = \begin{cases}-log(h_\theta(x))&\text{if y = 1}\\\\-log(1 - h_\theta(x)) &\text{if y=0}\end{cases}$

  - $Cost = 0$ if $y = 1, h_\theta(x) = 0$.

  - But as $h_\theta(x) \rarr 0, Cost \rarr \infty$

    Predict $P(y=1|x; \theta) = 0$, but $y = 1$, we'll penalize learning algorithm by a very large cost.

- We can also write it like below:

  - $Cost(h_\theta(x), y) = -ylog(h_\theta(x)) - (1-y)log(1 - h_\theta(x))$

![Logistic-Cost-Function](/Logistic-Regression-cost-function.png)

### Gradient Descent

- $J(\theta) = \frac{1}{m}\sum_{i=1}^mCost(h_\theta(x^{(i)}), y^{(i)})$
  
  $\rarr J(\theta) = -\frac{1}{m}[\sum_{i=1}^my^{(i)}log(h_\theta(x^{(i)}) - y^{(i)}) + (1 - y^{(i)})log(1 - h_\theta(x^{(i)}))]$

- Repeat:
  
  $\theta_j := \theta_j - \alpha\frac{\partial}{\partial\theta_j}J(\theta)$

  $\rarr \theta_j := \theta_j - \alpha\frac{1}{m}\sum_{i=1}^m(h_\theta(x^{(i)}) - y^{(i)})x^{(i)}_j$

  __It looks identical to Linear Regression. BUT:__

    - $h_\theta(x) = \theta^Tx$ in Linear Regression
    
    - In Logistic Regression is $h_\theta(x) = \frac{1}{1 + e^{-\theta^Tx}}$

- __Try to write it out:__
---
title: "Spring"
date: 2021-02-19T20:14:05+01:00
draft: false
tags: [Framework]
categories: [Learn]
featuredImagePreview: "/spring.jpg"
---

## 1. Overview

- Learn from online platform [bilibili](https://www.bilibili.com/video/BV1WE411d7Dv?from=search&seid=2004341521107708627).

### 1.1 Intro

- Based on [interface21](https://www.interface21.io/), 1.0 version published in 2014.

- Creator [Rod Johson](https://en.wikipedia.org/wiki/Rod_Johnson_(programmer))

- Aims at figuring out the complexity of the development for enterprise applications, by integrating the current techs to make them easier to use.

- Ingredients:

  - SSH: Struct2 + Spring + Hibernate

  - SSM: SpringMVC + Spring + Mybatis

### 1.2 Advantages

- Open source, free framework

- __Light__, uninvisioned framework

- __IOC(Inversion Of Control), AOP(Aspect Oriented Programming)__

- Supports the process of events and integration of frameworks

### 1.3 Composition

![composition_of_spring](/composition_of_spring.jpg)

- Spring Boot

  - Scaffload for quick development

  - Quick single micro servive development
  
  - Coordination is more important than configuration

- Spring Cloud

  - Based on Spring Boot

```xml
<!-- https://mvnrepository.com/artifact/org.springframework/spring-webmvc -->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-webmvc</artifactId>
    <version>5.3.6</version>
</dependency>
<!-- https://mvnrepository.com/artifact/org.springframework/spring-webmvc -->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-jdbc</artifactId>
    <version>5.3.6</version>
</dependency>
```

## 2. IoC theory

- __A method that through describtion and with the help of the third parts to get or new the specific objects.__

- __IoC container implements the Interval of Control, the method is DI (Dependicy Injection).__

- Before, programmers create objects, they control which objects to be created. By adding a `Setter()`, users have the right to create objects -> __decoupling__

- For example, `User.java` and `Service.java`.

  - Before decoupling:

    ```java
    public interface UserInter{
      void getUser();
    }
    ```

    ```java
    public class User implements UserInter{
      public void getUser(){
        System.out.println("Info from User");
      }
    }
    ```

    ```java
    public class UserSQL implements UserInter{
      public void getUser(){
        System.out.println("Info from UserSQL");
      }
    }
    ```

    ```java
    public class UserNginx implements UserInter{
      public void getUser(){
        System.out.println("Info from UserNginx");
      }
    }
    ```

    ```java
    public class Server{
      private User user = new User();
      public void getUser(){
        user.getUser();
      }
      // In this main method, if we want to get other informations from user
      // we need to create other classes (i.e. UserSQL, UserNginx, etc.)
      // which is not convenient
      // Or, we create o
    }
    ```

    ```java
    public class Test{
      Server server = new Server();
      server.getUser();
    }
    ```
  
  - After decoupling:

    ```java
    public class Server{
      private User user;
      // Set injection
      public void setUser(Uset user){
          this.user = user;
      }
      public void getUser(){
        user.getUser();
      }
    }
    ```

    ```java
    public class Test{
      Server server = new Server();
      server.setUser(new UserSQL());
      // After decoupling, we just need to change line
      // in the backets. We can new UserSQL, User, UserNginx, etc.
      server.getUser();
    }
    ```

    ![IOC](/IOC.png)

## 3. Hello Spring

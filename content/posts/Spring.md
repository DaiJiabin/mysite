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

## 2. IOC theory


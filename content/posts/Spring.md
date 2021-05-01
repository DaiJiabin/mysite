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

## 4. How does IoC create objects

1. Use methods without Parameters to create objects __by default__

2. 3 ways to create objects __with parameters__:

   - With the index of the initialization method

    ```xml
    <bean id="user" class="com.kuang.pojo.User">
      <constructor-arg index="0" value="Learn Spring"/>
    </bean>
    ```

   - With the type of parameters of initialization method ( not recommanded )

    ```xml
    <bean id="user" class="com.kuang.pojo.User">
      <constructor-arg type="java.lang.String" value="Learn Spring"/>
    </bean>
    ```

   - __With the name of parameters of initializtion method ( recommand )__

    ```xml
    <bean id="user" class="com.kuang.pojo.User">
      <constructor-arg name="name" value="Learn Spring"/>
    </bean>
    ```

3. __When loading cofigure file (xxx.xml), the objects in the container are initialized__

## 5. Configuration of Spring

### 5.1 alias

- `<alias name="user" alias="user2"/>` - single alias

- We can through the alias get the object.

### 5.2 configure bean

|          `id`           |     `class`     | `name` |
| :---------------------: | :-------------: | :----: |
| identifier, object-name | package + class | alias  |

- `<bean id="user" class="com.kuang.pojo.User" name="user3, user3, ...">`

- multi-alias in `<bean>`, can be seperated with `space`, `,`, `;`

### 5.3 import

- Used for teamwork, import and merge multi-configure files

- `<import resource="other_beans.xml"/>`

## 6. Dependency Injection (DI)

1. Constructor injection, see #4

2. `Set`

   - What is `DI` - __Set injection__

      - `Dependency`: The creation of the objects in bean depend on container

      - All attributes of the objects in bean are injected by container
   - An example
  
      ```xml
      <!--beans.xml-->
      <?xml version="1.0" encoding="UTF-8"?>
      <beans xmlns="http://www.springframework.org/schema/beans"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">
        <bean id="student" class="com.kuang.pojo.Student">
            <property name="name" value="zhangsan"/>
        </bean>
      </beans>
      ```

      ```java
      // Student.java
      public class Student {
        private String name;
        private Address address;
        private String[] books;
        private List<String> hobbys;
        private Map<String, String> card;
        private Set<String> games;
        private Properties info;
        private String wife;
      }
      ```

      ```java
      // Address.java
      public class Address {
        private String address;

        public void setAddr(String address) {
            this.address = address;
        }

        @Override
        public String toString() {
            return "Address{" +
                    "address='" + address + '\'' +
                    '}';
        }

        public String getAddr() {
            return address;
        }
      }
      ```

      ```java
      // Test Class
      public class MyTest {
        public static void main(String[] args) {
            ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
            Student student = (Student) context.getBean("student");
            System.out.println(student.toString());
        }
      }
      ```

      ```xml
      <!-- complete -->
      <bean id="address" class="com.kuang.pojo.Address">
          <property name="addr" value="Xian"/>
      </bean>

      <bean id="student" class="com.kuang.pojo.Student">
          <property name="name" value="zhangsan"/>
          <!-- reference here -->
          <property name="address" ref="address"/>
          <!-- Array -->
          <property name="books">
              <array>
                  <value>《黑暗森林》</value>
                  <value>《死神永生》</value>
                  <value>《人生海海》</value>
              </array>
          </property>
          <!-- List -->
          <property name="hobbys">
              <list>
                  <value>sing</value>
                  <value>code</value>
                  <value>music</value>
              </list>
          </property>
          <!-- Map -->
          <property name="card">
              <map>
                  <entry key="tianwang" value="dihu"/>
                  <entry key="ID" value="1234567890"/>
              </map>
          </property>
          <!-- Set -->
          <property name="games">
              <set>
                  <value>mario</value>
                  <value>lol</value>
                  <value>CS go</value>
              </set>
          </property>

          <property name="wife">
              <null/>
          </property>
          <!-- Properties -->
          <property name="info">
              <props>
                  <prop key="姓名">noone</prop>
                  <prop key="学号">10294658</prop>
              </props>
          </property>
      </bean>
      ```

   - Reference, click [here](https://docs.spring.io/spring-framework/docs/current/reference/html/core.html#beans-dependencies)

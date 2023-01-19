# In object-oriented programming (OOP) with Python, you define classes that represent real-world objects. Each class has its own properties (also known as attributes) and methods. Here is a simple example of a class called "Person":

class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def say_hello(self):
        print(f"Hello, my name is {self.name} and I am {self.age} years old.")

p1 = Person("John", 30)
p1.say_hello() # Output: "Hello, my name is John and I am 30 years old."

# In this example, the Person class has two attributes: name and age. The __init__ method is a special method that is called when a new object is created from the class. It is used to initialize the object's attributes. The say_hello method is a regular method that can be called on any object created from the Person class.

# You can also add properties and methods to the class.

class Person:
    def __init__(self, name, age):
        self._name = name
        self._age = age

    @property
    def name(self):
        return self._name
    
    @name.setter
    def name(self, value):
        self._name = value

    @property
    def age(self):
        return self._age
    
    @age.setter
    def age(self, value):
        self._age = value

    def say_hello(self):
        print(f"Hello, my name is {self._name} and I am {self._age} years old.")

p1 = Person("John", 30)
p1.say_hello() # Output: "Hello, my name is John and I am 30 years old."
p1.name = "Jane"
p1.say_hello() # Output: "Hello, my name is Jane and I am 30 years old."

# In this example, we added properties to the class, which allows us to get or set the value of name and age attributes by calling the name and age property respectively.

# This is a basic example of OOP in Python, but there are many more concepts and features that you can explore, such as inheritance, polymorphism, and encapsulation.




# /

# python_script.py

# --- Imports ---
import math
import datetime


# --- Classes ---
class Animal:
    """
    A simple class to represent an animal.
    """
    def __init__(self, name: str, species: str, age: int):
        """
        Initializes an Animal object.

        Args:
            name (str): The name of the animal.
            species (str): The species of the animal.
            age (int): The age of the animal in years.
        """
        self.name = name
        self.species = species
        self.age = age

    def describe(self) -> str:
        """
        Returns a string describing the animal.
        """
        return f"{self.name} is a {self.age}-year-old {self.species}."

    def celebrate_birthday(self):
        """
        Increments the animal's age by one year.
        """
        self.age += 1
        print(f"Happy birthday to {self.name}! They are now {self.age} years old.")

class Calculator:
    """
    A class providing basic mathematical operations.
    """
    def add(self, a: float, b: float) -> float:
        """Adds two numbers."""
        return a + b

    def subtract(self, a: float, b: float) -> float:
        """Subtracts two numbers."""
        return a - b

    def multiply(self, a: float, b: float) -> float:
        """Multiplies two numbers."""
        return a * b

    def divide(self, a: float, b: float) -> float:
        """
        Divides two numbers. Handles division by zero.
        """
        if b == 0:
            raise ValueError("Cannot divide by zero.")
        return a / b

# --- Functions ---
def greet(name: str) -> str:
    """
    Returns a personalized greeting message.

    Args:
        name (str): The name of the person to greet.

    Returns:
        str: The greeting message.
    """
    return f"Hello, {name}! Nice to see you."

def calculate_circle_area(radius: float) -> float:
    """
    Calculates the area of a circle given its radius.

    Args:
        radius (float): The radius of the circle.

    Returns:
        float: The area of the circle.
    """
    if radius < 0:
        raise ValueError("Radius cannot be negative.")
    return math.pi * (radius ** 2)

def get_current_timestamp() -> str:
    """
    Returns the current date and time as a formatted string.
    """
    now = datetime.datetime.now()
    return now.strftime("%Y-%m-%d %H:%M:%S")

# --- Main Execution Block ---
if __name__ == "__main__":
    print("--- Demonstrating Python Script ---")

    # Demonstrate Animal class
    print("\n--- Animal Class Demo ---")
    my_dog = Animal("Buddy", "Golden Retriever", 5)
    print(my_dog.describe())
    my_dog.celebrate_birthday()
    print(my_dog.describe())

    # Demonstrate Calculator class
    print("\n--- Calculator Class Demo ---")
    calc = Calculator()
    num1 = 10.5
    num2 = 2.5
    print(f"{num1} + {num2} = {calc.add(num1, num2)}")
    print(f"{num1} - {num2} = {calc.subtract(num1, num2)}")
    print(f"{num1} * {num2} = {calc.multiply(num1, num2)}")
    try:
        print(f"{num1} / {num2} = {calc.divide(num1, num2)}")
        print(f"{num1} / 0 = {calc.divide(num1, 0)}") # This will raise an error
    except ValueError as e:
        print(f"Error: {e}")

    # Demonstrate Functions
    print("\n--- Function Demo ---")
    user_name = "Alok" # Personalizing for Alok Shandilya
    print(greet(user_name))

    circle_radius = 5.0
    area = calculate_circle_area(circle_radius)
    print(f"The area of a circle with radius {circle_radius} is: {area:.2f}")

    print(f"Current timestamp: {get_current_timestamp()}")

    print("\n--- Script Finished ---")
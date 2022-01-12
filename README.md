# Meals Category App
Fetch Rewards - iOS Coding Challenge/Take home project

This app will display meals in alphabetically order with meals sorted into their respective categories
- When a use selects a category, they will be taken to a another view that displays meals for that category and when they click on the meal they get another view that displays the meal name, instructions, and ingredients/measurements for that meal.

*Technologies used
  - UIKit

*Arcitecture
  - MVC 

*Views
  - TableViewController for list of categories
  - TableViewController for meals of specific category
  - ViewController with details of meals

*Models
  - Category
  - Meals
  - MealsbyID

*Model Controllers
 - Each model is where I make the network call to get back the data needed for each swift object
  - Category
  -  Meals
  -  Meals details

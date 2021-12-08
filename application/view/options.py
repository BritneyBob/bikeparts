def main_menu():
    print()
    print("*" * 50)
    print("Welcome to the most helpful system ever")
    print("This is the main menu")
    print("*" * 50)
    print()
    print("What do you want to do?")
    print("1. View or update products")
    print("2. Update prices")
    print("3. Handle customers and customer orders")
    print("4. Handle vendors and auto orders")
    print("5. View stores")
    print()
    print("9. Quit")
    print()
    while True:
        choice = input("Choice: ")
        if choice in "123459" and len(choice) == 1:
            break
        print("Valid options are 1, 2, 3, 4, 5 or 9")
    return choice


def product_menu():
    print()
    print("*" * 50)
    print("Product menu")
    print("*" * 50)
    print("1. View list of products")
    print("2. View product details")
    print("3. Update product")
    print("4. Add product")
    print()
    print("9. Back to main menu")
    print()
    while True:
        choice = input("Choice: ")
        if choice in "12349" and len(choice) == 1:
            break
        print("Valid options are 1, 2, 3, 4 or 9")
    return choice


def pricing_menu():
    print()
    print("*" * 50)
    print("Pricing menu")
    print("*" * 50)
    print("1. Run supplier negotiation")
    print("2. Adjust sell margins")
    print()
    print("9. Back to main menu")
    print()
    while True:
        choice = input("Choice: ")
        if choice in "129" and len(choice) == 1:
            break
        print("Valid options are 1, 2, or 9")
    return choice


def customer_menu():
    print()
    print("*" * 50)
    print("Customer menu")
    print("*" * 50)
    print("1. Show all customers")
    print("2. Update customer information")
    print("3. Show all customer orders")
    print("4. Update customer order")
    print("5. Place customer order")
    print()
    print("9. Back to main menu")
    print()
    while True:
        choice = input("Choice: ")
        if choice in "123459" and len(choice) == 1:
            break
        print("Valid options are 1, 2, 3, 4, 5 or 9")
    return choice


def procurement_menu():
    print()
    print("*" * 50)
    print("Procurement menu")
    print("*" * 50)
    print("1. View or update supplier information")
    print("2. View or update manufacturer information")
    print("3. View or update auto order")
    print()
    print("9. Back to main menu")
    print()
    while True:
        choice = input("Choice: ")
        if choice in "1239" and len(choice) == 1:
            break
        print("Valid options are 1, 2, 3 or 9")
    return choice


def store_menu():
    print()
    print("*" * 50)
    print("Store menu")
    print("*" * 50)
    print("1. View stores")
    print("2. Add store")
    print()
    print("9. Back to main menu")
    print()
    while True:
        choice = input("Choice: ")
        if choice in "129" and len(choice) == 1:
            break
        print("Valid options are 1, 2 or 9")
    return choice

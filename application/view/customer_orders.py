from datetime import datetime, date

from application.controllers import customer_controller, customer_order_controller, customer_car_controller, \
    car_model_controller, spare_part_controller, store_controller
from application.view import options


def print_customer_order(customer_order):
    order_details = customer_order_controller.get_order_details_by_order_number(customer_order.
                                                                                customer_order_number)
    print("*" * 50)
    print(f"Order number {customer_order.customer_order_number}:")
    for order_detail in order_details:
        print("*" * 50)
        print(f"Product: {order_detail.spare_part.product_number}, {order_detail.spare_part.name}. Description: "
              f"{order_detail.spare_part.description}")
        print(f"Price per product: €{order_detail.price_each}")
        print(f"Quantity: {order_detail.quantity_ordered}")
        print(f"Total price: €{order_detail.price_each * order_detail.quantity_ordered}")
    print("*" * 50)
    print(f"Customer: {customer_order.customer.customer_id}, ", end='')
    if customer_order.customer.customer_name:
        print(f"{customer_order.customer.customer_name}\t", end='')
        print(f"Contact: {customer_order.customer.contact_last_name}, {customer_order.customer.contact_first_name}"
              f", {customer_order.customer.phonenumber}")
    else:
        print(f"{customer_order.customer.contact_last_name}, {customer_order.customer.contact_first_name}, "
              f"{customer_order.customer.phonenumber}")
    print(f"Store: {customer_order.store.store_id}, {customer_order.store.address.address_line2}, "
          f"{customer_order.store.address.city_name}")
    print(f"Employee: {customer_order.employee.employee_id}, {customer_order.employee.last_name}, "
          f"{customer_order.employee.first_name}")
    print(f"Order date: {customer_order.order_date}")
    if customer_order.shipped_date:
        print(f"Shipped date: {customer_order.shipped_date}")
    print(f"Status: {customer_order.status}")
    print(f"Comments: {customer_order.comments}")
    print()


def show_all_customer_orders():
    print("All customer orders: ")
    customer_orders = customer_order_controller.get_customer_orders()
    for customer_order in customer_orders:
        print_customer_order(customer_order)


def change_order_menu():
    print()
    print("*" * 50)
    print("Update order menu")
    print("*" * 50)
    print("1. Price")
    print("2. Quantity")
    print("3. Shipped date")
    print("4. Status")
    print("5. Comments")
    print()
    print("9. Back to customer menu")
    print()

    while True:
        choice = input("What would you like to change/add (1-5)?: ")
        if choice in "123459" and len(choice) == 1:
            break
        print("Valid options are 1, 2, 3, 4, 5, or 9")
    return choice


def update_customer_order():
    order_number = input("Please enter the id of the order you would like to update: ")
    order = customer_order_controller.get_customer_orders_by_order_number(order_number)
    order_details = customer_order_controller.get_order_details_by_order_number(order_number)

    print_customer_order(order)
    choice = change_order_menu()

    match choice:
        case "1":
            new_price = float(input("Please enter new price: "))
            customer_order_controller.update_price(order_details, new_price)

        case "2":
            new_quantity = int(input("Please enter new quantity: "))
            customer_order_controller.update_quantity(order_details, new_quantity)

        case "3":
            is_shipped = input("Has the order been shipped (Y, N)?: ")
            if is_shipped.upper() == "Y":
                shipped_date = date.today()
                customer_order_controller.add_shipped_date(order, shipped_date)
            else:
                print("Ok. No shipped date was added.")

        case "4":
            new_status = input("Please enter new status: ")
            customer_order_controller.update_status(order, new_status)

        case "5":
            new_comments = input("Please enter new comments: ")
            if order.comments:
                new_comments = order.comments + new_comments
            customer_order_controller.update_comments(order, new_comments)

        case "9":
            options.customer_menu()

    print("The order was updated with the new information: ")
    updated_order = customer_order_controller.get_customer_orders_by_order_number(order_number)
    print_customer_order(updated_order)


def get_customer_name(customer_id):
    customer = customer_controller.get_customer_by_id(customer_id)
    if customer.customer_name:
        customer_name = customer.customer_name
    else:
        customer_name = customer.contact_first_name + " " + customer.contact_last_name
    return customer_name


def print_customers_cars(cars, customer_name):
    car_models = []
    print(f"\nCustomer {customer_name} is the owner of the following car/s:")
    for i, car in enumerate(cars, 1):
        car_model = car_model_controller.get_car_model_by_id(car.car_model_id)
        car_models.append(car_model)
        print(f"{i}. {car.license_number}: {car_model.manufacturer} {car_model.model}, {car_model.year}, "
              f"{car.color}")

    return car_models


def choose_car_model(car_models):
    no_of_car_models = len(car_models)
    chosen_car = 0
    if no_of_car_models == 1:
        chosen_car = car_models[0]
    else:
        has_chosen = False
        while not has_chosen:
            choice = int(input(f"Which car does the customer want to buy a spare part for? (1-{no_of_car_models}): "))
            if 1 <= choice <= no_of_car_models:
                has_chosen = True
                chosen_car = car_models[choice - 1]
            else:
                print(f"Please choose a number (1-{no_of_car_models}):")

    return chosen_car


def choose_spare_part(chosen_car_model):
    spare_parts = chosen_car_model.spare_parts
    if not spare_parts:
        return None
    product_numbers = []
    chosen_product = None

    print(f"\nWe have the following spare part/s for {chosen_car_model.manufacturer} {chosen_car_model.model}, "
          f"{chosen_car_model.year}:")
    for spare_part in spare_parts:
        print(f"{spare_part.product_number}.\t{spare_part.name}. Description: {spare_part.description}.\tPrice: "
              f"€{spare_part.sell_price}")
        product_numbers.append(spare_part.product_number)

    if len(spare_parts) == 1:
        chosen_product = spare_parts[0]

    else:
        has_chosen = False
        while not has_chosen:
            chosen_product_number = int(input(f"\nWhich spare part does the customer want to buy"
                                              f" ({', '.join([str(i) for i in product_numbers])})?: "))
            for spare_part in spare_parts:
                if spare_part.product_number == chosen_product_number:
                    chosen_product = spare_part
                    has_chosen = True
                    break
            if not has_chosen:
                print("Please choose one of the product numbers listed.")

    return chosen_product


def choose_store(product, stores):
    store_ids = []
    chosen_store = None
    print(f"The following stores sells {product.name}:")
    for store in stores:
        print(f"Store id {store.store_id} at {store.store.address.address_line2} in "
              f"{store.store.address.city_name}, {store.store.address.country_name}")
        store_ids.append(store.store_id)

    if len(stores) == 1:
        chosen_store = stores[0]

    else:
        has_chosen = False
        while not has_chosen:
            chosen_store_id = int(input(f"Which store does the customer want to be teleported to "
                                        f"({', '.join([str(i) for i in store_ids])})?: "))
            for store in stores:
                if store.store_id == chosen_store_id:
                    chosen_store = store
                    has_chosen = True
                    break
            if not has_chosen:
                print("Please choose one of the stores listed.")

    return chosen_store


def choose_employee(store):
    employees = store.store.employees
    employee_ids = []
    chosen_employee = None

    print(f"These are the employees working in store number {store.store_id}:")
    for employee in employees:
        employee_id = employee.employee_id
        print(f"{employee_id}. {employee.last_name}, {employee.first_name}")
        employee_ids.append(employee_id)

    has_chosen = False
    while not has_chosen:
        chosen_employee_id = int(input(f"\nWho is selling the product "
                                       f"({', '.join([str(i) for i in employee_ids])})?: "))

        for employee in employees:
            if employee.employee_id == chosen_employee_id:
                chosen_employee = employee
                has_chosen = True
                break
        if not has_chosen:
            print("Please choose one of the employees listed.")

    return chosen_employee


def choose_and_check_quantity(product, store):
    has_chosen = False
    product_in_stock = store_controller.get_spare_part_in_store_by_store_id_and_product_number(store.store_id,
                                                                                               product.product_number)
    quantity_in_stock = product_in_stock.quantity_in_stock
    print(f"There are {quantity_in_stock} {product.name} in stock in store {store.store_id}, "
          f"{store.store.address.city_name}")

    while not has_chosen:
        quantity = int(input(f"How many {product.name} does the customer want?: "))
        if quantity > quantity_in_stock:
            print(f"You can only order a quantity that is less or equal to {quantity_in_stock}")
        else:
            return quantity


def print_list_of_fits_all_products():
    fits_all_spare_parts = []
    spare_parts_ids = []
    for spare_part in spare_part_controller.get_spare_parts():
        if len(spare_part.car_models) == 0:
            fits_all_spare_parts.append(spare_part)
            spare_parts_ids.append(spare_part.product_number)
    print("\nThe following products works with all car models:")
    for sp in fits_all_spare_parts:
        print(f"{sp.product_number}.\t{sp.name}. Description: {sp.description}.\tPrice: €{sp.sell_price}")

    return fits_all_spare_parts, spare_parts_ids


def order_spare_part_fits_all(products, product_numbers, customer_id):
    order_details_list = []
    chosen_product = None
    has_chosen = False

    while not has_chosen:
        fits_all_product_choice = input("\nDoes the customer want to place an order for one of the products above? "
                                        "(Enter product number or N)?: ")

        if fits_all_product_choice.upper() == "N":
            print("Ok. Going back to customer menu.")

        elif int(fits_all_product_choice) in product_numbers:
            for product in products:
                if product.product_number == int(fits_all_product_choice):
                    chosen_product = product
                    has_chosen = True
                    break
            stores = chosen_product.stores
            if len(stores) == 0:
                print(f"Unfortunately we don't have a/an {chosen_product.name}. Description: "
                      f"{chosen_product.description} in stock.")
                print("Going back to main menu.")
            else:
                chosen_store = choose_store(chosen_product, stores)
                chosen_employee = choose_employee(chosen_store)
                quantity = choose_and_check_quantity(chosen_product, chosen_store)
                order_details_list = insert_order_details(order_details_list, chosen_product, quantity)
                add_more_products = True
                while add_more_products:
                    add_more = input("Does the customer want to add another product from this store to their order "
                                     "(Y, N)?: ")
                    if add_more == "Y":
                        quantity, chosen_product = see_products_from_chosen_store(chosen_store)
                        order_details_list = insert_order_details(order_details_list, chosen_product, quantity)
                    elif add_more == "N":
                        place_order(order_details_list, chosen_store, chosen_employee, customer_id)
                        add_more_products = False
                has_chosen = True

        else:
            print("Please choose one of the product numbers listed, or N.")


def product_not_in_stock(chosen_car, chosen_product, customer_id):
    print(f"Unfortunately we don't have a/an {chosen_product.name}. Description: {chosen_product.description} "
          f"for {chosen_car.manufacturer} {chosen_car.model}, {chosen_car.year} in stock")
    find_fits_all_choice = input("Does the customer want to see the assortment for products that works with "
                                 "all car models (Y or N)?: ")

    if find_fits_all_choice.upper() == "Y":
        products, product_numbers = print_list_of_fits_all_products()
        order_spare_part_fits_all(products, product_numbers, customer_id)
    else:
        print("Ok. Going back to customer menu.")


def see_products_from_chosen_store(store):
    products = store_controller.get_spare_parts_by_store_id(store.store_id)
    product_numbers = []
    has_chosen = False
    chosen_product = None
    quantity = 0
    print(f"The following spare parts are sold in this store ({store.store_id}): ")
    for product in products:
        print(f"{product.product_number}.\t{product.name}. Description: {product.description}.\tPrice: "
              f"€{product.sell_price}")
        product_numbers.append(product.product_number)
    while not has_chosen:
        product_choice = input(f"Does the customer want to buy one of the products listed "
                               f"({', '.join([str(i) for i in product_numbers])}, N)?: ")
        if product_choice.upper() == "N":
            break
        for product in products:
            if product.product_number == int(product_choice):
                chosen_product = product
                quantity = choose_and_check_quantity(chosen_product, store)
                has_chosen = True
                break
        if not has_chosen:
            print("Please choose one of the products listed, or N to cancel.")

    return quantity, chosen_product


def place_order(order_details_list, store, employee, customer_id):
    customer_order = {
        "customer_id": customer_id,
        "store_id": store.store_id,
        "employee_id": employee.employee_id,
        "order_date": datetime.now(),
        "status": "Ordered"
    }
    products = []
    for order_details in order_details_list:
        quantity = order_details["quantity_ordered"]
        product = spare_part_controller.get_spare_part_by_id(order_details["product_number"])
        price_each = product.sell_price
        products.append((quantity, product, price_each, quantity * price_each))

    print("The following product/s has been added to the order:")
    print(50 * "*")
    for product in products:
        print(f"{product[1]}. Quantity: {product[0]}. Total price: €{product[3]}")
    print(50 * "*")
    print(f"Store: {store.store_id}, {store.store.address.city_name}, {store.store.address.country_name}")
    print(f"Employee: {employee.employee_id}, {employee.first_name} {employee.last_name}")
    print(50 * "*")

    order = input(
        f"Does the customer want to place the order (Y or N)?: ")

    if order.upper() == "Y":
        customer_order_controller.create_customer_order(customer_order)
        order = customer_order_controller.get_customer_orders_by_customer_id(customer_id)[-1]
        order_number = order.customer_order_number
        for order_details in order_details_list:
            order_details["customer_order_number"] = order_number
            customer_order_controller.create_order_details(order_details)
            store_controller.update_stock_in_store(store.store_id, order_details["product_number"],
                                                   -order_details["quantity_ordered"])
        print(f"The order was placed. ")

    else:
        print("Ok. No order was placed.")


def insert_order_details(order_details_list, product, quantity):
    price_each = product.sell_price
    product_number = product.product_number

    order_details = {
        "customer_order_number": None,
        "product_number": product_number,
        "price_each": price_each,
        "quantity_ordered": quantity
    }

    order_details_list.append(order_details)
    return order_details_list


def place_order_choices():
    customer_id = input("Please enter customer id: ")
    customer = get_customer_name(customer_id)
    cars = customer_car_controller.get_customers_cars(customer_id)
    order_details_list = []

    while True:
        if cars:
            car_models = print_customers_cars(cars, customer)
            chosen_car = choose_car_model(car_models)
            chosen_product = choose_spare_part(chosen_car)
            if not chosen_product:
                print(f"Unfortunately we don't sell any spare parts for {chosen_car.manufacturer} {chosen_car.model}, "
                      f"{chosen_car.year}")
                find_fits_all_choice = input(
                    "Does the customer want to see the assortment for products that works with "
                    "all car models (Y or N)?: ")
                if find_fits_all_choice.upper() == "Y":
                    products, product_numbers = print_list_of_fits_all_products()
                    order_spare_part_fits_all(products, product_numbers, customer_id)
                    break
                else:
                    print("Ok. Going back to customer menu.")
                    break

            stores = chosen_product.stores
            if len(stores) == 0:
                product_not_in_stock(chosen_car, chosen_product, customer_id)
            else:
                chosen_store = choose_store(chosen_product, stores)
                chosen_employee = choose_employee(chosen_store)
                quantity = choose_and_check_quantity(chosen_product, chosen_store)
                order_details_list = insert_order_details(order_details_list, chosen_product, quantity)
                add_more_products = True
                while add_more_products:
                    add_more = input("Does the customer want to add another product from this store to their order "
                                     "(Y, N)?: ")
                    if add_more.upper() == "Y":
                        quantity, chosen_product = see_products_from_chosen_store(chosen_store)
                        order_details_list = insert_order_details(order_details_list, chosen_product, quantity)
                    elif add_more.upper() == "N":
                        place_order(order_details_list, chosen_store, chosen_employee, customer_id)
                        add_more_products = False
                    else:
                        print("Valid inputs are Y and N.")
                break

        else:
            print(f"The chosen customer {customer} does not own any car.")
            find_fits_all_choice = input("Does the customer want to see the assortment for products that works with "
                                         "all car models (Y or N)?: ")

            if find_fits_all_choice.upper() == "Y":
                products, product_numbers = print_list_of_fits_all_products()
                order_spare_part_fits_all(products, product_numbers, customer_id)
                break
            else:
                print("Ok. Going back to customer menu.")
                break

def choose_new_employee(store):
    employees = store.store.employees
    employee_ids = []

    print(f"These are the employees working in store number {store.store_id}:")
    for employee in employees:
        print(f"{employee.employee_id}. {employee.last_name}, {employee.first_name}")
        employee_ids.append(employee.employee_id)

    new_employee_id = input(f"Please enter new employee id ({', '.join([str(i) for i in employee_ids])}): ")
    return new_employee_id

case
"1":
cars = customer_car_controller.get_customers_cars(order.customer_id)
if cars:
    car_models = print_customers_cars(cars, get_customer_name(order.customer_id))
    chosen_car = choose_car_model(car_models)
    new_product = choose_spare_part(chosen_car)
    stores = new_product.stores
    if len(stores) == 0:
        print("The chosen product is unfortunately not sold in any of our stores at the moment. The "
              "order was not updated")
    else:
        new_store = choose_store(new_product, stores)
        new_employee = choose_employee(new_store)
        customer_order_controller.update_product(order_details, new_product.product_number)
        customer_order_controller.update_store(order, new_store.store_id)
        customer_order_controller.update_employee(order, new_employee.employee_id)
else:
    print(f"The customer on the order {customer_controller.get_customer_by_id(order.customer_id)} does not "
          f"own any car.")
    find_fits_all_choice = input("Does the customer want change to a product that works with all car models"
                                 " (Y or N)?: ")

    if find_fits_all_choice.upper() == "Y":
        products, product_numbers = print_list_of_fits_all_products()
        order_spare_part_fits_all(products, product_numbers, order.customer_id)
    else:
        print("Ok. The order was not updated.")

case "4":
    new_customer_id = input("Please enter new customer id: ")
            customer_order_controller.update_customer(order, new_customer_id)

case
"5":
product = spare_part_controller.get_spare_part_by_id(order_details.product_number)
stores = product.stores
if len(stores) == 1:
    print(f"Can't change store since {product.name} is not sold in another store.")
else:
    store_ids = []
    print(f"The following stores sells {product.name}:")
    for store in product.stores:
        print(f"Store id {store.store_id} at {store.store.address.address_line2} in "
              f"{store.store.address.city_name}, {store.store.address.country_name}")
        store_ids.append(store.store_id)

    new_store_id = input(f"Please enter new store id ({', '.join([str(i) for i in store_ids])}): ")
    customer_order_controller.update_store(order, new_store_id)
    store = store_controller.get_store_by_id(new_store_id)
    new_employee_id = choose_new_employee(store)
    customer_order_controller.update_employee(order, new_employee_id)

case
"6":
store = store_controller.get_store_by_id(order.store_id)
new_employee_id = choose_new_employee(store)
customer_order_controller.update_employee(order, new_employee_id)

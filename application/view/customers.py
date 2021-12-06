from application.controllers import customer_controller, customer_order_controller, customer_car_controller, \
    car_model_controller


def show_all_customers():
    print("All customers: ")
    customers = customer_controller.get_customers()
    for customer in customers:
        print(f"Id: {customer.customer_id}\t", end='')
        if customer.customer_name:
            print(f"Name: {customer.customer_name}\t", end='')
            print(f"Contact: {customer.contact_last_name}, {customer.contact_first_name}\t", end='')
        else:
            print(f"Name: {customer.contact_last_name}, {customer.contact_first_name} \t", end='')
        print(f"Phone number: {customer.phonenumber}\t")


def show_all_customer_orders():
    print("All customer orders: ")
    customer_orders = customer_order_controller.get_customer_orders()
    for customer_order in customer_orders:
        print(f"Order number: {customer_order.customer_order_number}\t", end='')
        if True:
            print(f"Customer:\t", end='')
            print(f"Contact: , \t", end='')
        else:
            print(f"Customer: , \t", end='')
        print(f"Store: \t", end='')
        print(f"Employee: \t", end='')
        print(f"Order date: \t", end='')
        if True:
            print(f"Shipped date: \t", end='')
        print(f"Status: \t", end='')
        if True:
            print(f"Comments: \t", end='')


def place_order():
    customer_id = input("Please enter customer id: ")
    cars = customer_car_controller.get_customers_cars(customer_id)
    if cars:
        customer = customer_controller.get_customer_by_id(customer_id)
        if customer.customer_name:
            customer_name = customer.customer_name
        else:
            customer_name = customer.contact_first_name + " " + customer.contact_last_name
        print(f"{customer_name} has the following car/s:")
        for car in cars:
            car_model = car_model_controller.get_car_model_by_id(car.car_model_id)
            print(car.license_number, car_model.manufacturer, car_model.model, car_model.year, car.color)

        if len(cars) == 1:
            print(f"We have the following spare parts for {cars[0]}")
    else:
        print("The chosen customer does not own any car.")




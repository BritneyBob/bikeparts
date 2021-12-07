from application.controllers import customer_controller, customer_order_controller, customer_car_controller, \
    car_model_controller, spare_part_controller


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
    product_numbers = []
    chosen_product = None
    chosen_product_number = None

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

    return chosen_product, chosen_product_number


def choose_store(product, product_number, stores):
    store_ids = []
    chosen_store = None
    print(f"{product_number}.\t{product.name}, {product.description} is in stock in the following store/s:")
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


def product_not_in_stock(chosen_car, chosen_product):
    print(f"Unfortunately we don't have a/an {chosen_product.name}. Description: {chosen_product.description} "
          f"for {chosen_car.manufacturer} {chosen_car.model}, {chosen_car.year} in stock")
    find_fits_all_choice = input("Does the customer want to see the assortment for products that works with "
                                 "all car models (Y or N)?: ")

    if find_fits_all_choice.upper() == "Y":
        products, product_numbers = print_list_of_fits_all_products()
        new_chosen_product = None
        has_chosen = False
        while not has_chosen:
            fits_all_product_choice = input("\nDoes the customer want to place an order for one of the products above? "
                                            "(Enter product number or N)?: ")

            if fits_all_product_choice.upper() == "N":
                print("Ok. Going back to customer menu.")

            elif int(fits_all_product_choice) in product_numbers:
                for product in products:
                    if product.product_number == int(fits_all_product_choice):
                        new_chosen_product = product
                        has_chosen = True
                        break
                stores = new_chosen_product.stores
                if len(stores) == 0:
                    print(f"Unfortunately we don't have a/an {new_chosen_product.name}. Description: "
                          f"{new_chosen_product.description} in stock.")
                    print("Going back to main menu.")
                else:
                    chosen_store = choose_store(new_chosen_product, new_chosen_product.product_number, stores)
                    place_order(new_chosen_product, chosen_store)

            else:
                print("Please choose one of the product numbers listed, or N.")
    else:
        print("Ok. Going back to customer menu.")


def place_order(product, store):
    order = input(
        f"Does the customer want to place an order for one {product.name} from store number {store.store_id} in "
        f"{store.store.address.city_name}, {store.store.address.country_name} (Y or N)? ")

    if order.upper() == "Y":
        # TODO: Write function to remove one of chosen product from stock
        print(f"Order placed for 1 {product.name}, €{product.sell_price}")
    else:
        print("Ok. No order was placed.")


def order_choices():
    customer_id = input("Please enter customer id: ")
    customer = get_customer_name(customer_id)
    cars = customer_car_controller.get_customers_cars(customer_id)

    if cars:
        car_models = print_customers_cars(cars, customer)
        chosen_car = choose_car_model(car_models)
        chosen_product, product_number = choose_spare_part(chosen_car)
        stores = chosen_product.stores
        if len(stores) == 0:
            product_not_in_stock(chosen_car, chosen_product)
        else:
            chosen_store = choose_store(chosen_product, product_number, stores)
            place_order(chosen_product, chosen_store)

    else:
        print(f"The chosen customer {customer} does not own any car.")



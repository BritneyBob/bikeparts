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
        car_models = []
        print(f"\n{customer_name} is the owner of the following car/s:")
        for i, car in enumerate(cars, 1):
            car_model = car_model_controller.get_car_model_by_id(car.car_model_id)
            car_models.append(car_model)
            print(f"{i}. {car.license_number}: {car_model.manufacturer} {car_model.model}, {car_model.year}, "
                  f"{car.color}")

        if len(car_models) == 1:
            chosen_car_model = car_models[0]
        else:
            choice = int(input(f"Which car does the customer want to buy a spare part for? (1-{len(car_models)}): "))
            chosen_car_model = car_models[choice - 1]

        print(f"\nWe have the following spare part/s for {chosen_car_model.manufacturer} {chosen_car_model.model}, "
              f"{chosen_car_model.year}:")
        spare_parts = chosen_car_model.spare_parts
        product_numbers = []
        for spare_part in spare_parts:
            print(f"{spare_part.product_number}.\t{spare_part.name}, {spare_part.description}.\tPrice: "
                  f"€{spare_part.sell_price}")
            product_numbers.append(spare_part.product_number)

        if len(spare_parts) == 1:
            chosen_product = spare_parts[0]
        else:
            chosen = False
            while not chosen:
                chosen_product_number = int(input(f"\nWhich spare part does the customer want to buy"
                                                  f" ({', '.join([str(i) for i in product_numbers])})?: "))
                for spare_part in spare_parts:
                    if spare_part.product_number == chosen_product_number:
                        chosen_product = spare_part
                        chosen = True
                        break
                if not chosen:
                    print("Please choose one of the product numbers listed.")

        stores = chosen_product.stores
        store_ids = []
        print(f"{chosen_product_number}.\t{chosen_product.name}, {chosen_product.description} is in stock in "
              f"the following store/s:")
        for store in stores:
            print(f"Store id {store.store_id} at {store.store.address.address_line2} in "
                  f"{store.store.address.city_name}, {store.store.address.country_name}")
            store_ids.append(store.store_id)
        if len(stores) == 0:
            print(f"Unfortunately we don't have a/an {chosen_product.name}, {chosen_product.description} for "
                  f"{chosen_car_model.manufacturer} {chosen_car_model.model}, {chosen_car_model.year} in stock")
            find_fits_all_choice = input("Does the customer want to see the assortment for products that works with "
                                         "all car models(Y or N)?")

            if find_fits_all_choice.upper() == "Y":
                print(f"")
            else:
                print("Ok. Going back to customer menu.")

        elif len(stores) == 1:
            chosen_store = stores[0]
        else:
            store_is_chosen = False
            while not store_is_chosen:
                chosen_store_id = input(f"Which store does the customer want to be teleported to?: "
                                        f"({', '.join([str(i) for i in store_ids])})")
                for store in stores:
                    if store.store_id == chosen_store_id:
                        chosen_store = store
                        store_is_chosen = True
                        break
                if not store_is_chosen:
                    print("Please choose one of the product numbers listed.")

        order = input(f"Does the customer want to place an order for 1 {chosen_product.name} from store number "
                      f"{chosen_store.store_id} in {chosen_store.store.address.city_name}, "
                      f"{chosen_store.store.address.country_name} (Y or N)? ")
        if order.upper() == "Y":
            # TODO: Write function to remove one of chosen product from stock
            print(f"Order placed for 1 {chosen_product.name}, €{chosen_product.sell_price}")
        else:
            print("Ok. No order was placed.")

    else:
        print("The chosen customer does not own any car.")

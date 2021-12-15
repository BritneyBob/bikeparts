from application.controllers import spare_part_controller, company_controller
from application.controllers.spare_part_controller import adjust_price, update_product
from application.controllers.store_controller import view_stores, get_spare_part_in_store_by_store_id_and_product_number


def search_spare_parts():
    name_filter = input("Which product are you looking for? Enter name/part of name. Leave blank to show all: ")
    search_hits = spare_part_controller.get_spare_parts_by_filter(name_filter)
    for spare_part in search_hits:
        print(f"Product number: {spare_part.product_number}\t\tProduct name: {spare_part.name}\t\t"
              f"Description: {spare_part.description}\t\tPrice to customer: {spare_part.sell_price} EUR")


def show_all_spare_parts():
    print("List of available spare parts: ")
    spare_parts = spare_part_controller.get_spare_parts()
    for spare_part in spare_parts:
        print(f"Product number: {spare_part.product_number}\t\tName: {spare_part.name}"
              f"\t\tDescription: {spare_part.description}\t\tPrice: {spare_part.sell_price} EUR")


def show_one_spare_part():
    product_no = input("Enter product number to show one product: ")  # TODO Error handling of input!
    print("*" * 50)
    print_spare_part_info(product_no)
    print_supplier(product_no)
    print_manufacturer(product_no)
    print_stock_info(product_no)
    print("*" * 50)


def print_spare_part_info(product_no):
    spare_part = spare_part_controller.get_spare_part_by_id(product_no)
    print(f"Product number and name: {spare_part.product_number} {spare_part.name}")
    print(f"Description: {spare_part.description}")
    print(f"Customer price: {spare_part.sell_price} EUR")


def print_supplier(product_no):
    suppliers = spare_part_controller.get_spare_part_suppliers(product_no)
    print(f"Available from the following suppliers: ")
    for supplier in suppliers:
        supplier_company = spare_part_controller.get_spare_part_supplier_company(supplier.supplier_id)
        for company in supplier_company:
            print(f"\tCompany name: {company.company_name}\tBuy price: {supplier.buy_price} EUR")


def print_manufacturer(product_no):
    spare_part = spare_part_controller.get_spare_part_by_id(product_no)
    manufacturer_id_s = [manufacturer.manufacturer_id for manufacturer in spare_part.manufacturers]
    print(f"Manufactured by: ")
    for manufacturer_id in manufacturer_id_s:
        manufacturer_company = spare_part_controller.get_spare_part_manufacturer_company(manufacturer_id)
        for company in manufacturer_company:
            print(f"\tCompany name: {company.company_name}")


def print_stock_info(product_no):
    sorted_stores = sorted(view_stores(), key=lambda x: x.store_id)
    print(f"Items in stock in the following stores: ")
    for store in sorted_stores:
        product_in_stock = get_spare_part_in_store_by_store_id_and_product_number(store.store_id, product_no)
        if product_in_stock is None:
            continue
        else:
            print((f"\t{store.store_id} {store.address.city_name}\t "
                   f"Stock: {product_in_stock.quantity_in_stock}\tShelf number: {product_in_stock.shelf_number}"))


def update_a_product():
    search_spare_parts()
    product_no = input("\nEnter product number to update: ")
    spare_part = spare_part_controller.get_spare_part_by_id(product_no)
    print("*" * 50)
    print_spare_part_info(product_no)
    print("*" * 50)

    # TODO Error handling of inputs that are too long for the database field
    new_name = input("\nEnter new name, or leave blank to keep the current name: ")
    new_description = input("\nEnter new description, or leave blank to keep the current description: ")
    if new_name == "" and new_description == "":
        print("No values were changed. Going back to product menu.")
    else:
        if new_name == "":
            new_name = spare_part.name
        else:
            new_name = new_name
        if new_description == "":
            new_description = spare_part.description
        else:
            # try:
            new_description = new_description
            # except (DataError, errors.DataError):
            #     print("You have entered a too long description, please try again!")
        update_product(product_no, new_name, new_description)

        print("\nProduct info was updated. New information is:")
        print("*" * 50)
        print_spare_part_info(product_no)
        print("*" * 50)


def add_product():
    print("Please enter product details for the new product!")
    name = input("Product name: ")
    description = input("Description: ")
    sell_price = input("Customer price: ")
    new_product = {
        "name": name,
        "description": description,
        "sell_price": sell_price
    }
    spare_part_controller.create_spare_part(new_product)
    adding_info = True
    added_product = spare_part_controller.get_spare_parts_by_filter(name)
    for product in added_product:
        # TODO what if there is a double? Is there a way to get the recently added product no?
        while adding_info:
            print("Product details for the new product: ")
            print_spare_part_info(product.product_number)
            print_supplier(product.product_number)
            print_manufacturer(product.product_number)
            print_stock_info(product.product_number)

            add_info = input("Do you want to add more product info? Y/N: ")
            if add_info.lower() == "n":
                adding_info = False
            else:
                choice = input("Which info do you want to add? S = suppliers, M = manufacturers, T = store: ")
                match choice.lower():
                    case "s":
                        add_supplier_to_product(product)
                    case "m":
                        add_manufacturer_to_product(product)
                    case "t":
                        add_stores_to_product(product)
                    case "_":
                        print("Please try again! The valid choices are S, M or T")


def add_supplier_to_product(product):
    adding_suppliers = True
    while adding_suppliers:
        print("Available suppliers: ")
        all_suppliers = company_controller.get_suppliers()
        for supplier in all_suppliers:
            print(f"Id: {supplier.supplier_id} Company name: {supplier.company.company_name}")
        chosen_supplier_id = input("Enter a supplier id from the list: ")
        price = input("Enter the agreed buy price (EUR): ")
        delivery_time = input("Enter the number of days to deliver from this supplier: ")
        spare_part_supplier = {
            "product_number": product.product_number,
            "supplier_id": chosen_supplier_id,
            "buy_price": price,
            "delivery_time": delivery_time
        }
        spare_part_controller.create_spare_part_supplier(spare_part_supplier)
        add_more = input("Do you want to add another supplier? Y/N: ")
        if add_more.lower() == "n":
            adding_suppliers = False


def add_manufacturer_to_product(product):
    adding_manufacturers = True
    while adding_manufacturers:
        print("Available manufacturers: ")
        all_manufacturers = company_controller.get_manufacturers()
        for manufacturer in all_manufacturers:
            print(f"Id: {manufacturer.manufacturer_id} Company name: {manufacturer.company.company_name}")
        chosen_manufacturer_id = input("Enter a manufacturer id from the list: ")
        spare_part_controller.create_spare_part_manufacturer(product.product_number, chosen_manufacturer_id)
        add_more = input("Do you want to add another manufacturer? Y/N: ")
        if add_more.lower() == "n":
            adding_manufacturers = False


def add_stores_to_product(product):
    adding_stores = True
    while adding_stores:
        print("Available manufacturers: ")
        all_stores = view_stores()
        for store in all_stores:
            print(f"Id: {store.store_id} City: {store.address.city_name}")
        chosen_store_id = input("Enter a store id from the list: ")
        shelf_number = input("Enter shelf number: ")
        quantity_in_stock = input("Enter actual quantity in stock: ")
        lowest_index = input("Enter stock value for autoorder: ")
        quantity_to_order = input("Enter order quantity for autoorder: ")
        spare_part_in_store = {
            "product_number": product.product_number,
            "store_id": chosen_store_id,
            "shelf_number": shelf_number,
            "quantity_in_stock": quantity_in_stock,
            "lowest_index": lowest_index,
            "quantity_to_order": quantity_to_order
        }
        spare_part_controller.create_spare_part_in_store(spare_part_in_store)
        add_more = input("Do you want to add the product to another store? Y/N: ")
        if add_more.lower() == "n":
            adding_stores = False


def adjust_sell_margins():
    name_filter = input("Which products sell margin do you want to adjust? Enter name/part of name: ")
    search_hits = spare_part_controller.get_spare_parts_by_filter(name_filter)
    for hit in search_hits:
        print(hit)
    product_no = input('\nEnter Product number for the product you want to adjust sell margins on: ')
    print_spare_part_info(product_no)
    new_price = input('Enter new sell price, EUR: ')
    adjust_price(product_no, new_price)
    print('Sell price has been updated.')

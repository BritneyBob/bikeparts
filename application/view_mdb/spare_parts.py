from mysql.connector import errors
from sqlalchemy.exc import DataError

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
    spare_part = spare_part_controller.get_spare_part_by_id(product_no)
    print(f"Items in stock in the following stores: ")
    for store in sorted_stores:
        if spare_part.quantity_in_stock == 0:
            continue
        else:
            print((f"\t{store.store_id} {store.address.city_name}\t "
                   f"Stock: {spare_part.quantity_in_stock}\tShelf number: {spare_part.shelf_number}"))
        # try:
        #     print(f"\t{store.store_id} {store.address.city_name}\t "
        #           f"Stock: {stock_info.quantity_in_stock}\tShelf number: {stock_info.shelf_number}")
        # except:
        #     continue


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
    added_product = spare_part_controller.get_spare_parts_by_filter(name)
    # TODO what if there is a double? Is there a way to get the recently added product no?
    print(f"Added new product: ")
    for product in added_product:
        print_spare_part_info(product.product_number)
    print("Do you want to add suppliers? Y/N: ")


# def add_supplier_to_product(product_number):
#     product_number = product_number
    print("Available suppliers: ")
    all_suppliers = company_controller.get_suppliers()
    for supplier in all_suppliers:
        # supplier_companies = spare_part_controller.get_spare_part_supplier_company()
        # for company in supplier_companies:
        print(f"Id: {supplier.supplier_id} Company name: {supplier.company}")
    # supplier_id = input("Enter a supplier id from the list: ")


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

from application.controllers import spare_part_controller
from application.controllers.spare_part_controller import adjust_price


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
    print_spare_part(product_no)


def print_spare_part(product_no):
    spare_part = spare_part_controller.get_spare_part_by_id(product_no)
    suppliers = spare_part_controller.get_spare_part_suppliers(product_no)
    # stores =
    # manufacturers = spare_part_controller.get_spare_part_manufacturers(product_no)
    print("*" * 50)
    print(f"Product number and name: {spare_part.product_number} {spare_part.name}")
    print(f"Description: {spare_part.description}")
    print(f"Customer price: {spare_part.sell_price} EUR")
    print(f"Available from the following suppliers: ")
    for supplier in suppliers:
        supplier_company = spare_part_controller.get_spare_part_supplier_company(supplier.supplier_id)
        print(f"Company name: {supplier_company}\tBuy price: {supplier.buy_price} EUR")
        # TODO Find out why I can't print company name. supplier_company.company_name => error
    # print(f"Manufactured by: ")
    # for manufacturer in manufacturers:
    #     manufacturer_company = spare_part_controller.get_spare_part_manufacturer_company(manufacturer.manufacturer_id)
    #     print(f"Company name: {manufacturer_company}")
    print(f"Items in stock: ")


def adjust_sell_margins():
    name_filter = input("Which products sell margin do you want to adjust? Enter name/part of name: ")
    search_hits = spare_part_controller.get_spare_parts_by_filter(name_filter)
    for hit in search_hits:
        print(hit)
    product_no = input('\nEnter Product number for the product you want to adjust sell margins on: ')
    print_spare_part(product_no)
    new_price = input('Enter new sell price, EUR: ')
    adjust_price(product_no, new_price)
    print('Sell price has been updated.')

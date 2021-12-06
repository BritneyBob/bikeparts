from application.controllers import spare_part_controller


# TODO Is it possible to show list with e.g. 20 hits at a time?
from application.controllers.spare_part_controller import adjust_price


def show_all_spare_parts():
    print("List of available spare parts: ")
    spare_parts = spare_part_controller.get_spare_parts()
    for spare_part in spare_parts:
        print(f"Product number: {spare_part.product_number}\t\tName: {spare_part.name}"
              f"\t\tDescription: {spare_part.description}\t\tPrice: {spare_part.sell_price} EUR")


def show_spare_part():
    name_filter = input("Which product are you looking for? Enter name/part of name: ")
    search_hits = spare_part_controller.get_spare_parts_by_filter(name_filter)
    for hit in search_hits:
        print(hit)
    product_no = input("Enter product number to show one product: ")  # TODO Error handling of input!
    print_spare_part(product_no)


def print_spare_part(product_no):
    spare_part = spare_part_controller.get_spare_part_by_id(product_no)
    suppliers = spare_part_controller.get_spare_part_supplier_by_id(product_no)
    print("*" * 50)
    print(f"Product number and name: {spare_part.product_number} {spare_part.name}")
    print(f"Description: {spare_part.description}")
    print(f"Sell price: {spare_part.sell_price} EUR")
    print(f"Available from the following suppliers: ")
    for supplier in suppliers:
        print(f"Company id: {supplier.supplier.company.company_id}\tName: {supplier.supplier.company.company_name}"
              f"\tBuy price: {supplier.buy_price} EUR")
    # Add suppliers and price
    print(f"Manufactured by: ")
    # Add manufacturer
    print(f"Items in stock: ")
    # Add store + stock


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







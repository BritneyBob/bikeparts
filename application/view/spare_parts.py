from application.controllers.spare_part_controller import get_spare_parts, get_spare_part_by_id, \
    get_spare_parts_by_filter, get_spare_part_supplier_by_id


# TODO Is it possible to show list with e.g. 20 hits at a time?
def show_all_spare_parts():
    print("List of available spare parts: ")
    spare_parts = get_spare_parts()
    for spare_part in spare_parts:
        print(f"Product number: {spare_part.product_number}\t\tName: {spare_part.name}"
              f"\t\tDescription: {spare_part.description}\t\tPrice: {spare_part.sell_price} EUR")


def show_spare_part():
    name_filter = input("Which product are you looking for? Enter name/part of name: ")
    search_hits = get_spare_parts_by_filter(name_filter)
    for hit in search_hits:
        print(f"Product number: {hit.product_number}\t\tName: {hit.name}"
              f"\t\tDescription: {hit.description}\t\tPrice: {hit.sell_price} EUR")
    product_no = input("Enter product number to show one product: ")  # TODO Error handling of input!
    spare_part = get_spare_part_by_id(product_no)
    suppliers = get_spare_part_supplier_by_id(product_no)
    print("*" * 50)
    print(f"Product number and name: {spare_part.product_number} {spare_part.name}")
    print(f"Description: {spare_part.description}")
    print(f"Sell price: {spare_part.sell_price} EUR")
    print(f"Available from the following suppliers: ")
    for supplier in suppliers:
        print(f"Name: {supplier.supplier}\tBuy price: {supplier.buy_price} EUR")
    # Add suppliers and price
    print(f"Manufactured by: ")
    # Add manufacturer
    print(f"Items in stock: ")
    # Add store + stock

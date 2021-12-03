from application.controllers import spare_part_controller


# TODO Is it possible to show list with e.g. 20 hits at a time?
def show_all_spare_parts():
    print("List of available spare parts: ")
    spare_parts = spare_part_controller.get_spare_parts()
    for spare_part in spare_parts:
        print(spare_part)


def show_spare_part():
    name_filter = input("Which product are you looking for? Enter name/part of name: ")
    search_hits = spare_part_controller.get_spare_parts_by_filter(name_filter)
    print(search_hits)
    product_no = input("Enter product number to show one product: ")  # TODO Error handling of input!
    spare_part = spare_part_controller.get_spare_part_by_id(product_no)
    suppliers = spare_part_controller.get_spare_part_supplier_by_id(product_no)
    print("*" * 50)
    print(f"Product number and name: {spare_part.product_number} {spare_part.name}")
    print(f"Description: {spare_part.description}")
    print(f"Sell price: {spare_part.sell_price} SEK")
    print(f"Available from the following suppliers: ")
    for supplier in suppliers:
        print(f"Name: {supplier.supplier}\tBuy price: {supplier.buy_price}")
    # Add suppliers and price
    print(f"Manufactured by: ")
    # Add manufacturer
    print(f"Items in stock: ")
    # Add store + stock

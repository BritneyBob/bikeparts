from application.data.repository import auto_order_repository


def low_index(store_id, product_number):
    return auto_order_repository.low_index(store_id, product_number)


def lowest_buy_price(product_number):
    return auto_order_repository.lowest_buy_price(product_number)


def create_auto_order(store_id, product_number, supplier_id):
    return auto_order_repository.create_auto_order(store_id, product_number, supplier_id)
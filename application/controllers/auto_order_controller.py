from application.data.repository import auto_order_repository


def low_index(store_id, product_number):
    return auto_order_repository.low_index(store_id, product_number)


def lowest_buy_price(product_number):
    return auto_order_repository.lowest_buy_price(product_number)

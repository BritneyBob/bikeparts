from application.dataMDB.repositoryMDB import supplier_order_repository


def low_index(store_id, product_number):
    return auto_order_repository.low_index(store_id, product_number)


def lowest_buy_price(product_number):
    return auto_order_repository.lowest_buy_price(product_number)


def create_auto_order(store_id, product_number, supplier_id):
    return auto_order_repository.create_auto_order(store_id, product_number, supplier_id)


def get_auto_orders():
    return auto_order_repository.get_auto_orders()


def create_order(supplier_order):
    return supplier_order_repository.create_order(supplier_order)

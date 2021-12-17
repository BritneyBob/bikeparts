from application.dataMDB.repositoryMDB import store_repository


def create_store(store):
    store_repository.create_store(store)


def get_store_by_number(store_number):
    return store_repository.get_store_by_number(store_number)


def get_stores():
    return store_repository.get_stores()


def update_stock_in_store(store_id, product_number, ordered_quantity):
    return store_repository.update_stock_in_store(store_id, product_number, ordered_quantity)


def get_stores_by_numbers(store_numbers):
    return store_repository.get_stores_by_numbers(store_numbers)


def add_product_to_store(store, product):
    store_repository.add_product_to_store(store, product)

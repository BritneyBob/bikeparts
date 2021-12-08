from application.data.repository import store_repository


def create_store(store):
    store_repository.create_store(store)


def view_stores():
    return store_repository.view_stores()


def update_stock_in_store(store_id, product_number, ordered_quantity):
    return store_repository.update_stock_in_store(store_id, product_number, ordered_quantity)


def get_spare_part_in_store_by_store_id_and_product_number(store_id, product_number):
    return store_repository.get_spare_part_in_store_by_store_id_and_product_number(store_id, product_number)

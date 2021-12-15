from application.data.dataMDB.repositoryMDB import store_repository


def create_store(store):
    store_repository.create_store(store)


def get_store_by_id(store_id):
    return store_repository.get_store_by_id(store_id)


def get_stores():
    return store_repository.get_stores()


def update_stock_in_store(store_id, product_number, ordered_quantity):
    return store_repository.update_stock_in_store(store_id, product_number, ordered_quantity)


def get_spare_part_in_store_by_store_id_and_product_number(store_id, product_number):
    return store_repository.get_spare_part_in_store_by_store_id_and_product_number(store_id, product_number)


def get_spare_parts_by_store_id(store_id):
    return store_repository.get_spare_parts_by_store_id(store_id)


def get_stores_by_ids(store_ids):
    return store_repository.get_stores_by_ids(store_ids)


def add_product_to_store(store, product):
    store_repository.add_product_to_store(store, product)

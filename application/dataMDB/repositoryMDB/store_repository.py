from application.dataMDB.modelsMDB import Store


def create_store(store):
    store = Store(**store)
    store.save()


def get_store_by_id(store_id):
    return Store.find(store_id=store_id).first_or_none()


def get_stores():
    return Store.all()


def update_stock_in_store(store_id, product_id, quantity):
    store = get_store_by_id(store_id)
    for product in store.products:
        if product_id == product["new_product_id"]:
            product["quantity_in_stock"] += quantity
            store.save()

    updated_product_in_stock = None
    for product in store.products:
        if product_id == product["new_product_id"]:
            updated_product_in_stock = product
    if quantity > 0:
        print(f"Ordered {quantity} items of product number {product_id}.")
    print(f"Quantity product {product_id} in stock, store {store_id}: {updated_product_in_stock['quantity_in_stock']} "
          f"items.")


def get_spare_part_in_store_by_store_id_and_product_number(store_id, product_number):
    return session.query(SparePartInStore).filter(SparePartInStore.store_id == store_id). \
        filter(SparePartInStore.product_number == product_number).first()


def get_spare_parts_by_store_id(store_id):
    return session.query(SparePartInStore).filter(SparePartInStore.store_id == store_id).all()


def get_stores_by_ids(store_ids):
    return [get_store_by_id(store_id) for store_id in store_ids]

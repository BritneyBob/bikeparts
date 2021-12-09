from application.data.db import session
from application.data.models import Store, Address, AddressType, SparePartInStore


def create_store(store):
    store = Store(**store)
    session.add(store)
    session.commit()


def get_store_by_id(store_id):
    return session.query(Store).filter(Store.store_id == store_id).first()


def view_stores():
    return session.query(Store).join(Address).join(AddressType).filter(AddressType.address_type_id == 3).all()


def update_stock_in_store(store_id, product_number, quantity):
    product_in_stock = session.query(SparePartInStore).filter(SparePartInStore.store_id == store_id).\
        filter(SparePartInStore.product_number == product_number).first()
    product_in_stock.quantity_in_stock += quantity
    session.commit()
    updated_product_in_stock = session.query(SparePartInStore).filter(SparePartInStore.store_id == store_id). \
        filter(SparePartInStore.product_number == product_number).first()
    if quantity > 0:
        print(f"Ordered {quantity} items of product number {product_number}.")
    print(f"Quantity product {product_number} in stock, store {store_id}: {updated_product_in_stock.quantity_in_stock} "
          f"items.")


def get_spare_part_in_store_by_store_id_and_product_number(store_id, product_number):
    return session.query(SparePartInStore).filter(SparePartInStore.store_id == store_id). \
        filter(SparePartInStore.product_number == product_number).first()

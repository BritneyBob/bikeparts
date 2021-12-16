import random
from application.dataMDB.modelsMDB import Store


def create_store(store):
    store = Store(**store)
    store.save()


def get_store_by_number(store_number):
    return Store.find(store_number=store_number).first_or_none()


def get_stores():
    return Store.all()


def update_stock_in_store(store_number, product_id, quantity):
    store = get_store_by_number(store_number)
    for product in store.products:
        if product_id == product["product_id"]:
            product["quantity_in_stock"] += quantity
            store.save()

    updated_product_in_stock = None
    for product in store.products:
        if product_id == product["product_id"]:
            updated_product_in_stock = product
    if quantity > 0:
        print(f"Ordered {quantity} items of product number {product_id}.")
    print(f"Quantity product {product_id} in stock, store {store_number}: "
          f"{updated_product_in_stock['quantity_in_stock']} items.")


def get_stores_by_numbers(store_numbers):
    return [get_store_by_number(store_number) for store_number in store_numbers]


def add_product_to_store(store, product):
    letters = "ABCDEFGHIJKLMNOPQRSTUVXYZ"
    numbers = "123456789"
    new_product = {
            "shelf_number": f"{random.choice(letters)}{random.choice(numbers)}",
            "quantity_in_stock": 0,
            "product_id": product._id
        }
    store.products.append(new_product)
    store.save()

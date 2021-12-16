from application.controllers import store_controller
from application.dataMDB.modelsMDB import SupplierOrder
from datetime import datetime, date, timedelta



def low_index(store_id, product_number):
    return session.query(SparePartInStore).filter(SparePartInStore.store_id == store_id).\
        filter(SparePartInStore.product_number == product_number).all()


def lowest_buy_price(product_number):
    return session.query(SparePartSupplier).filter(SparePartSupplier.product_number == product_number).all()






def create_order(supplier_order):
    SupplierOrder(supplier_order).save()


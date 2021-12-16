from application.dataMDB.modelsMDB import SupplierOrder


def lowest_buy_price(product_number):
    return session.query(SparePartSupplier).filter(SparePartSupplier.product_number == product_number).all()


def create_order(supplier_order):
    SupplierOrder(supplier_order).save()


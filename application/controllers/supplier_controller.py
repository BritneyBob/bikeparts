from application.data.repository import supplier_repository


def create_supplier(supplier):
    supplier_repository.create_supplier(supplier)


def get_suppliers():
    return supplier_repository.get_suppliers()


def negotiation(id_and_buy_price, comp_and_supp_id):
    return supplier_repository.negotiation(id_and_buy_price, comp_and_supp_id)


# def show_products_from_company(_id):
#     return supplier_repository.show_products_from_company(_id)


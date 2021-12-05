from application.data.repository import supplier_repository


def create_supplier(supplier):
    supplier_repository.create_supplier(supplier)


def get_suppliers():
    return supplier_repository.get_suppliers()


def show_products_from_company(_id):
    return supplier_repository.show_products_from_company(_id)


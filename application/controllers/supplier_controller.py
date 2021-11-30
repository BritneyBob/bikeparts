from application.data.repository import supplier_repository


def create_supplier(supplier):
    supplier_repository.create_supplier(supplier)


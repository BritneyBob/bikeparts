from application.dataMDB.base_documentMDB import Document, db


class Product(Document):
    collection = db.products


class Store(Document):
    collection = db.stores


class Company(Document):
    collection = db.companies


class Customer(Document):
    collection = db.customers


class CustomerOrder(Document):
    collection = db.customer_orders


class SupplierOrder(Document):
    collection = db.supplier_orders

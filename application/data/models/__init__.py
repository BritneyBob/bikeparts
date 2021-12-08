from sqlalchemy import Integer, String, Column, ForeignKey, DateTime, Date, Text, Numeric, Boolean, Float, Table
from sqlalchemy.orm import relationship

from application.data.db import Base


customers_have_addresses_table = Table("customers_have_addresses", Base.metadata,
                                       Column("customer_id", ForeignKey("customers.customer_id"), primary_key=True,
                                              nullable=False),
                                       Column("address_id", ForeignKey("addresses.address_id"),
                                              primary_key=True, nullable=False))


companies_has_addresses_table = Table("companies_has_addresses", Base.metadata,
                                      Column("company_id", ForeignKey("companies.company_id"), primary_key=True,
                                             nullable=False),
                                      Column("address_id", ForeignKey("addresses.address_id"),
                                             primary_key=True, nullable=False))


class Address(Base):
    __tablename__ = "addresses"

    address_id = Column(Integer, primary_key=True, autoincrement=True)
    address_type_id = Column(Integer, ForeignKey("address_types.address_type_id"), nullable=False)
    address_line1 = Column(String(100))
    address_line2 = Column(String(100))
    zipcode = Column(String(15), nullable=False)
    city_name = Column(String(60), nullable=False)
    country_name = Column(String(45), nullable=False)

    address_type = relationship("AddressType", back_populates="addresses")
    store = relationship("Store", back_populates="address", uselist=False)
    customers = relationship("Customer", secondary=customers_have_addresses_table, back_populates="addresses")
    companies = relationship("Company", secondary=companies_has_addresses_table, back_populates='addresses')


class AddressType(Base):
    __tablename__ = "address_types"

    address_type_id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    address_type_name = Column(String(45))
    addresses = relationship("Address", back_populates="address_type")


class AutoOrder(Base):
    __tablename__ = "auto_orders"

    order_id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    product_number = Column(Integer, nullable=False)
    store_id = Column(Integer, nullable=False)
    supplier_id = Column(Integer, nullable=False)
    order_date = Column(Date, nullable=False)
    arrival_date = Column(Date)
    ordered_quantity = Column(Integer, nullable=False)
    price_each = Column(Numeric, nullable=False)


car_models_have_spare_parts_table = Table("car_models_have_spare_parts", Base.metadata,
                                          Column("car_model_id", ForeignKey('car_models.car_model_id'),
                                                 primary_key=True),
                                          Column("product_number", ForeignKey('spare_parts.product_number'),
                                                 primary_key=True))


class CarModel(Base):
    __tablename__ = "car_models"

    car_model_id = Column(Integer, primary_key=True, autoincrement=True)
    manufacturer = Column(String(45), nullable=False)
    model = Column(String(45), nullable=False)
    year = Column(String(4), nullable=False)
    customers = relationship("CustomerCar", back_populates="car_model")
    spare_parts = relationship("SparePart", secondary=car_models_have_spare_parts_table, back_populates="car_models")


# Should this rather be an association table, and not a class?
# class CarModelSparePart(Base):
#     __tablename__ = "car_models_have_spare_parts"
#
#     car_model_id = Column(Integer, ForeignKey('car_models.car_model_id'), primary_key=True, nullable=False)
#     product_number = Column(Integer, ForeignKey('spare_parts.product_number'), primary_key=True, nullable=False)
#     car_models = relationship("CarModel", back_populates="spare_parts")
#     spare_parts = relationship("SparePart", back_populates="car_models")


class Company(Base):
    __tablename__ = "companies"  # den här håller koll på vilken tabell vi matchar

    company_id = Column(Integer, primary_key=True, autoincrement=True)
    company_name = Column(String(100), nullable=False)
    contact = Column(String(100), nullable=False)
    contact_phonenumber = Column(String(20), nullable=False)
    contact_email = Column(String(100), nullable=False)

    manufacturer = relationship("Manufacturer", back_populates="company", uselist=False)
    supplier = relationship("Supplier", back_populates="company", uselist=False)
    addresses = relationship("Address", secondary=companies_has_addresses_table, back_populates='companies')

    def __repr__(self):
        return f"{self.company_id}, {self.company_name}, {self.contact}, {self.contact_phonenumber}, " \
               f"{self.contact_email}"

class Customer(Base):
    __tablename__ = "customers"

    customer_id = Column(Integer, primary_key=True, autoincrement=True)
    customer_name = Column(String(100), nullable=True)
    contact_first_name = Column(String(60), nullable=False)
    contact_last_name = Column(String(60), nullable=False)
    phonenumber = Column(String(20), nullable=False)
    is_company = Column(Boolean, nullable=False)
    car_models = relationship("CustomerCar", back_populates="customer")
    stores = relationship("CustomerOrder", back_populates="customer")
    addresses = relationship("Address", secondary=customers_have_addresses_table, back_populates="customers")

    def __repr__(self):
        return f"Customer id: {self.customer_id}\tCompany name (if company): {self.customer_name}\t" \
               f"Contact: {self.contact_first_name} {self.contact_last_name}\tPhone number: {self.phonenumber}" \


# Should this be an association table instead of a class?
# class CustomerAddress(Base):
#     __tablename__ = "customers_have_addresses"
#
#     customer_id = Column(Integer, ForeignKey('customers.customer_id'), primary_key=True, nullable=False)
#     address_id = Column(Integer, ForeignKey('addresses.address_id'), primary_key=True, nullable=False)
#     customers = relationship("Customer", back_populates="addresses")
#     addresses = relationship("Address", back_populates="customers")


class CustomerCar(Base):
    __tablename__ = "customer_cars"

    license_number = Column(String(6), primary_key=True, nullable=False, autoincrement=True)
    customer_id = Column(Integer, ForeignKey("customers.customer_id"))
    car_model_id = Column(Integer, ForeignKey("car_models.car_model_id"))
    color = Column(String(20), nullable=False)
    customer = relationship("Customer", back_populates="car_models")
    car_model = relationship("CarModel", back_populates="customers")


class CustomerOrder(Base):
    __tablename__ = "customer_orders"
    customer_order_number = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    customer_id = Column(Integer, ForeignKey('customers.customer_id'), nullable=False)
    store_id = Column(Integer, ForeignKey('stores.store_id'), nullable=False)
    employee_id = Column(Integer, ForeignKey('employees.employee_id'), nullable=False)
    order_date = Column(DateTime, nullable=False)
    shipped_date = Column(Date)
    status = Column(String(45), nullable=False)
    comments = Column(Text)

    spare_parts = relationship("OrderDetail", back_populates="customer_order")
    customer = relationship("Customer", back_populates="stores")
    store = relationship("Store", back_populates="customers")
    employee = relationship("Employee", back_populates="customer_orders")


class Employee(Base):
    __tablename__ = "employees"

    employee_id = Column(Integer, primary_key=True, autoincrement=True)
    store_id = Column(Integer, ForeignKey("stores.store_id"))
    first_name = Column(String(60), nullable=False)
    last_name = Column(String(60), nullable=False)
    email = Column(String(100), nullable=False)

    customer_orders = relationship("CustomerOrder", back_populates="employee")
    store = relationship("Store", back_populates="employees")


spare_parts_have_manufacturers_table = Table("spare_parts_have_manufacturers", Base.metadata,
                                             Column("product_number", ForeignKey("spare_parts.product_number"),
                                                    primary_key=True, nullable=False),
                                             Column("manufacturer_id", ForeignKey("manufacturers.manufacturer_id"),
                                                    primary_key=True, nullable=False))


class Manufacturer(Base):
    __tablename__ = "manufacturers"

    manufacturer_id = Column(Integer, primary_key=True, autoincrement=True)
    company_id = Column(Integer, ForeignKey("companies.company_id"))
    company = relationship("Company", back_populates="manufacturer")
    spare_parts = relationship("SparePart", secondary=spare_parts_have_manufacturers_table,
                               back_populates="manufacturers")


class OrderDetail(Base):
    __tablename__ = "order_details"

    customer_order_number = Column(Integer, ForeignKey('customer_orders.customer_order_number'), primary_key=True,
                                   nullable=False)
    product_number = Column(Integer, ForeignKey('spare_parts.product_number'), primary_key=True, nullable=False)
    price_each = Column(Numeric, nullable=False)
    quantity_ordered = Column(Integer, nullable=False)

    customer_order = relationship("CustomerOrder", back_populates="spare_parts")
    spare_part = relationship("SparePart", back_populates="customer_orders")


class SparePart(Base):
    __tablename__ = "spare_parts"

    product_number = Column(Integer, primary_key=True, nullable=False)
    name = Column(String(100), nullable=False)
    description = Column(String(45), nullable=False)
    sell_price = Column(Float, nullable=False)

    car_models = relationship("CarModel", secondary=car_models_have_spare_parts_table, back_populates="spare_parts")
    customer_orders = relationship("OrderDetail", back_populates="spare_part")
    manufacturers = relationship("Manufacturer", secondary=spare_parts_have_manufacturers_table,
                                 back_populates="spare_parts")
    suppliers = relationship("SparePartSupplier", back_populates="spare_part")
    stores = relationship("SparePartInStore", back_populates="spare_part")

    def __repr__(self):
        return f"{self.product_number}, {self.name}, {self.description}, {self.sell_price}"


class SparePartInStore(Base):
    __tablename__ = "spare_parts_in_stores"

    product_number = Column(Integer, ForeignKey('spare_parts.product_number'), primary_key=True, nullable=False)
    store_id = Column(Integer, ForeignKey('stores.store_id'), primary_key=True, nullable=False)
    shelf_number = Column(String(4), nullable=False)
    quantity_in_stock = Column(Integer, nullable=False)
    lowest_index = Column(Integer, nullable=False)
    quantity_to_order = Column(Integer, nullable=False)

    spare_part = relationship("SparePart", back_populates="stores")
    store = relationship("Store", back_populates="spare_parts")


# class SparePartManufacturer(Base):
#     __tablename__ = "spare_parts_have_manufacturers"
#
#     product_number = Column(Integer, ForeignKey('spare_parts.product_number'), primary_key=True, nullable=False)
#     manufacturer_id = Column(Integer, ForeignKey('manufacturers.manufacturer_id'), primary_key=True, nullable=False)
#     spare_part = relationship("SparePart", back_populates="manufacturers")
#     manufacturer = relationship("Manufacturer", back_populates="spare_parts")


class SparePartSupplier(Base):
    __tablename__ = "spare_parts_have_suppliers"

    product_number = Column(Integer, ForeignKey('spare_parts.product_number'), primary_key=True, nullable=False)
    supplier_id = Column(Integer, ForeignKey('suppliers.supplier_id'), primary_key=True, nullable=False)
    buy_price = Column(Numeric, nullable=False)
    delivery_time = Column(Integer, nullable=False)
    spare_part = relationship("SparePart", back_populates="suppliers")
    supplier = relationship("Supplier", back_populates="spare_parts")

    def __repr__(self):
        return f"{self.product_number}, {self.supplier_id}, {self.buy_price}, {self.delivery_time}" \
               f" - {self.spare_part}, {self.supplier}"


class Store(Base):
    __tablename__ = "stores"

    store_id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    address_id = Column(Integer, ForeignKey('addresses.address_id'), nullable=False)

    employees = relationship("Employee", back_populates="store")
    address = relationship("Address", back_populates="store")
    spare_parts = relationship("SparePartInStore", back_populates="store")
    customers = relationship("CustomerOrder", back_populates="store")


class Supplier(Base):
    __tablename__ = "suppliers"

    supplier_id = Column(Integer, primary_key=True, autoincrement=True)
    company_id = Column(Integer, ForeignKey("companies.company_id"))

    company = relationship("Company", back_populates="supplier")
    spare_parts = relationship("SparePartSupplier", back_populates="supplier")

    def __repr__(self):
        return f"{self.supplier_id}, {self.company_id} - {self.company}, {self.spare_parts}"

from sqlalchemy import Integer, String, Column, ForeignKey
from sqlalchemy.orm import relationship

from application.data.db import Base

from application.data.models.store import Store
from application.data.models.customer_address import CustomerAddress


class Address(Base):
    __tablename__ = "addresses"

    address_id = Column(Integer, primary_key=True, autoincrement=True)
    address_type_id = Column(Integer, ForeignKey("address_types.address_type_id"), nullable=False)
    company_id = Column(Integer, ForeignKey("companies.company_id"), nullable=False)
    address_line1 = Column(String(100))
    address_line2 = Column(String(100))
    zip_code = Column(String(15), nullable=False)
    city_name = Column(String(60), nullable=False)
    country_name = Column(String(45), nullable=False)
    stores = relationship("Store", back_populates="addresses")
    customers = relationship("CustomerAdress", back_populates="addresses")
    companies = relationship('Company', back_populates='addresses')
    # One-to-many: Address is parent - no need to add relationships to address_types and companies


class AddressType(Base):
    __tablename__ = "address_types"

    address_type_id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    address_type_name = Column(String(45))
    addresses = relationship("Address")


class AutoOrder(Base):
    __tablename__ = "auto_orders"

    order_id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    product_number = Column(Integer, ForeignKey('spare_parts.product_number'), nullable=False)
    store_id = Column(Integer, ForeignKey('stores.store_id'), nullable=False)
    supplier_id = Column(Integer, ForeignKey('suppliers.supplier_id'), nullable=False)
    arrival_date = Column(Date)
    ordered_quantity = Column(Integer, nullable=False)
    price_each = Column(Numeric, nullable=False)
    # TODO: Add relation to suppliers
    # TODO: Add relation to spare_parts_in_stores


class CarModel(Base):
    __tablename__ = "car_models"

    car_model_id = Column(Integer, primary_key=True, autoincrement=True)
    manufacturer = Column(String(45), nullable=False)
    model = Column(String(45), nullable=False)
    year = Column(String(4), nullable=False)
    customers = relationship("CustomerCar", back_populates="car_models")
    spare_parts = relationship("CarModelSparePart", back_populates="car_models")


# Should this rather be an association table, and not a class?
class CarModelSparePart(Base):
    __tablename__ = "car_models_have_spare_parts"

    car_model_id = Column(Integer, ForeignKey('car_models.car_model_id'), primary_key=True, nullable=False)
    product_number = Column(Integer, ForeignKey('spare_parts.product_number'), primary_key=True, nullable=False)
    car_models = relationship("CarModel", back_populates="spare_parts")
    spare_parts = relationship("SparePart", back_populates="car_models")


class Company(Base):
    __tablename__ = "companies"  # den här håller koll på vilken tabell vi matchar

    company_id = Column(Integer, primary_key=True, autoincrement=True)
    #address_id = Column(Integer, ForeignKey='addresses.address_id', nullable=False)
    company_name = Column(String(100), nullable=False)
    contact = Column(String(100), nullable=False)
    contact_phonenumber = Column(String(20), nullable=False)
    contact_email = Column(String(100), nullable=False)
    manufacturer = relationship("Manufacturer", back_populates="company", uselist=False)
    supplier = relationship("Supplier", back_populates="company", uselist=False)
    #addresses = relationship('Address', back_populates='companies')
    # TODO: Add address_id FK and relation to addresses


class Customer(Base):
    __tablename__ = "customers"

    customer_id = Column(Integer, primary_key=True, autoincrement=True)
    customer_name = Column(String(100), nullable=True)
    contact_first_name = Column(String(60), nullable=False)
    contact_last_name = Column(String(60), nullable=False)
    phonenumber = Column(String(20), nullable=False)
    is_company = Column(Boolean, nullable=False)
    car_models = relationship("CustomerCar", back_populates="customers")
    customer_orders = relationship("CustomerOrder")
    addresses = relationship("CustomerAddress", back_populates="customers")


# Should this be an association table instead of a class?
class CustomerAddress(Base):
    __tablename__ = "customers_have_addresses"

    customer_id = Column(Integer, ForeignKey('customers.customer_id'), primary_key=True, nullable=False)
    address_id = Column(Integer, ForeignKey('addresses.address_id'), primary_key=True, nullable=False)
    customers = relationship("Customer", back_populates="addresses")
    addresses = relationship("Address", back_populates="customers")

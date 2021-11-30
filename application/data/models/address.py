from sqlalchemy import Integer, String, Column, ForeignKey
from sqlalchemy.orm import relationship

from application.data.db import Base


class Address(Base):
    __tablename__ = "addresses"

    address_id = Column(Integer, primary_key=True, autoincrement=True)
    address_type_id = Column(Integer, ForeignKey("address_types.address_type_id"))
    company_id = Column(Integer, ForeignKey("companies.company_id"))
    address_line1 = Column(String(100), nullable=True)
    address_line2 = Column(String(100), nullable=True)
    zip_code = Column(String(15), nullable=False)
    city_name = Column(String(60), nullable=False)
    country_name = Column(String(45), nullable=False)
    stores = relationship("Store", back_populates="addresses")
    customers = relationship("CustomerAdress", back_populates="addresses")
    # One-to-many: Address is parent - no need to add relationships to address_types and companies
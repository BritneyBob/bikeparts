from sqlalchemy import Integer, String, Column, ForeignKey
from sqlalchemy.orm import relationship

from application.data.db import Base


class Company(Base):
    __tablename__ = "companies"  # den här håller koll på vilken tabell vi matchar

    company_id = Column(Integer, primary_key=True, autoincrement=True)
    address_id = Column(Integer, ForeignKey='addresses.address_id', nullable=False)
    company_name = Column(String(100), nullable=False)
    contact = Column(String(100), nullable=False)
    contact_phonenumber = Column(String(20), nullable=False)
    contact_email = Column(String(100), nullable=False)
    manufacturers = relationship("Manufacturer", back_populates="companies", uselist=False)
    suppliers = relationship("Supplier", back_populates="companies", uselist=False)
    addresses = relationship('Address', back_populates='companies')
    # TODO: Add address_id FK and relation to addresses. Done!

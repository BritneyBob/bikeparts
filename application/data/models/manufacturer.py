from sqlalchemy import Integer, Column, ForeignKey
from sqlalchemy.orm import relationship

from application.data.db import Base

from application.data.models.company import Company
from application.data.models.spare_part_manufacturer import SparePartManufacturer


class Manufacturer(Base):
    __tablename__ = "manufacturers"

    manufacturer_id = Column(Integer, primary_key=True, autoincrement=True)
    company_id = Column(Integer, ForeignKey("companies.company_id"))
    company = relationship("Company", back_populates="manufacturer")
    spare_parts = relationship("SparePartManufacturer", back_populates="manufacturer")

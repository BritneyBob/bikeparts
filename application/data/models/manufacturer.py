from sqlalchemy import Integer, Column, ForeignKey
from sqlalchemy.orm import relationship

from application.data.db import Base


class Manufacturer(Base):
    __tablename__ = "manufacturers"  # den här håller koll på vilken tabell vi matchar

    manufacturer_id = Column(Integer, primary_key=True, autoincrement=True)
    company_id = Column(Integer, ForeignKey("companies.company_id"))
    company = relationship("Company", back_populates="manufacturers")

from sqlalchemy import Integer, String, Column

from application.data.db import Base


class Address(Base):
    __tablename__ = "addresses"

    address_id = Column(Integer, primary_key=True, autoincrement=True)
    address_type_id = Column(Integer, foreign_key)
    company_id = Column(Integer, foreign_key)
    address_line1 = Column(String(100), nullable=True)
    address_line2 = Column(String(100), nullable=True)
    zip_code = Column(String(15), nullable=False)
    city_name = Column(String(60), nullable=False)
    country_name = Column(String(45), nullable=False)

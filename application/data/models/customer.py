from sqlalchemy import Integer, String, Column, Boolean

from application.data.db import Base


class Customer(Base):
    __tablename__ = "customers"  # den här håller koll på vilken tabell vi matchar

    customer_id = Column(Integer, primary_key=True, autoincrement=True)
    customer_name = Column(String(60), nullable=True)
    contact_first_name = Column(String(60), nullable=False)
    contact_last_name = Column(String(60), nullable=False)

    email = Column(String(45), nullable=False)
    phonenumber = Column(String(45), nullable=False)
    is_company = Column(Boolean, nullable=False)

from sqlalchemy import Integer, String, Column

from application.data.db import Base


class Employee(Base):
    __tablename__ = "employees"  # den här håller koll på vilken tabell vi matchar

    company_id = Column(Integer, primary_key=True, autoincrement=True)
    company_name = Column(String(60), nullable=False)
    contact_name = Column(String(60), nullable=False)
    contact_phonenumber = Column(String(45), nullable=False)
    contact_email = Column(String(100), nullable=False)

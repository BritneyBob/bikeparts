from sqlalchemy import Integer, String, Column, ForeignKey

from application.data.db import Base


class Employee(Base):
    __tablename__ = "employees"

    employee_id = Column(Integer, primary_key=True, autoincrement=True)
    store_id = Column(Integer, ForeignKey("stores.store_id"))
    first_name = Column(String(60), nullable=False)
    last_name = Column(String(60), nullable=False)
    email = Column(String(100), nullable=False)


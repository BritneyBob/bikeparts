from sqlalchemy import Integer, String, Column

from application.data.db import Base


class Employee(Base):
    __tablename__ = "employees"  # den här håller koll på vilken tabell vi matchar

    employee_id = Column(Integer, primary_key=True, autoincrement=True)
    store_id = Column(Integer, foreign_key)
    first_name = Column(String(60), nullable=False)
    last_name = Column(String(60), nullable=False)
    email = Column(String(100), nullable=False)
